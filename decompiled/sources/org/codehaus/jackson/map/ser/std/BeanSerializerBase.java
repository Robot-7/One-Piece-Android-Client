package org.codehaus.jackson.map.ser.std;

import java.io.IOException;
import java.lang.reflect.Type;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ResolvableSerializer;
import org.codehaus.jackson.map.SerializerProvider;
import org.codehaus.jackson.map.TypeSerializer;
import org.codehaus.jackson.map.ser.AnyGetterWriter;
import org.codehaus.jackson.map.ser.BeanPropertyFilter;
import org.codehaus.jackson.map.ser.BeanPropertyWriter;
import org.codehaus.jackson.map.ser.FilterProvider;
import org.codehaus.jackson.node.ObjectNode;
import org.codehaus.jackson.schema.JsonSchema;
import org.codehaus.jackson.schema.SchemaAware;
import org.codehaus.jackson.type.JavaType;

/* JADX INFO: loaded from: classes.dex */
public abstract class BeanSerializerBase extends SerializerBase<Object> implements ResolvableSerializer, SchemaAware {
    protected static final BeanPropertyWriter[] NO_PROPS = new BeanPropertyWriter[0];
    protected final AnyGetterWriter _anyGetterWriter;
    protected final BeanPropertyWriter[] _filteredProps;
    protected final Object _propertyFilterId;
    protected final BeanPropertyWriter[] _props;

    @Override // org.codehaus.jackson.map.ser.std.SerializerBase, org.codehaus.jackson.map.JsonSerializer
    public abstract void serialize(Object obj, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws IOException;

    protected BeanSerializerBase(JavaType type, BeanPropertyWriter[] properties, BeanPropertyWriter[] filteredProperties, AnyGetterWriter anyGetterWriter, Object filterId) {
        super(type);
        this._props = properties;
        this._filteredProps = filteredProperties;
        this._anyGetterWriter = anyGetterWriter;
        this._propertyFilterId = filterId;
    }

    public BeanSerializerBase(Class<?> rawType, BeanPropertyWriter[] properties, BeanPropertyWriter[] filteredProperties, AnyGetterWriter anyGetterWriter, Object filterId) {
        super(rawType);
        this._props = properties;
        this._filteredProps = filteredProperties;
        this._anyGetterWriter = anyGetterWriter;
        this._propertyFilterId = filterId;
    }

    protected BeanSerializerBase(BeanSerializerBase src) {
        this((Class<?>) src._handledType, src._props, src._filteredProps, src._anyGetterWriter, src._propertyFilterId);
    }

    @Override // org.codehaus.jackson.map.JsonSerializer
    public void serializeWithType(Object bean, JsonGenerator jgen, SerializerProvider provider, TypeSerializer typeSer) throws IOException {
        typeSer.writeTypePrefixForObject(bean, jgen);
        if (this._propertyFilterId != null) {
            serializeFieldsFiltered(bean, jgen, provider);
        } else {
            serializeFields(bean, jgen, provider);
        }
        typeSer.writeTypeSuffixForObject(bean, jgen);
    }

    protected void serializeFields(Object bean, JsonGenerator jgen, SerializerProvider provider) throws IOException {
        BeanPropertyWriter[] props;
        if (this._filteredProps != null && provider.getSerializationView() != null) {
            props = this._filteredProps;
        } else {
            props = this._props;
        }
        int i = 0;
        try {
            int len = props.length;
            while (i < len) {
                BeanPropertyWriter prop = props[i];
                if (prop != null) {
                    prop.serializeAsField(bean, jgen, provider);
                }
                i++;
            }
            if (this._anyGetterWriter != null) {
                this._anyGetterWriter.getAndSerialize(bean, jgen, provider);
            }
        } catch (Exception e) {
            String name = i == props.length ? "[anySetter]" : props[i].getName();
            wrapAndThrow(provider, e, bean, name);
        } catch (StackOverflowError e2) {
            JsonMappingException mapE = new JsonMappingException("Infinite recursion (StackOverflowError)");
            String name2 = i == props.length ? "[anySetter]" : props[i].getName();
            mapE.prependPath(new JsonMappingException.Reference(bean, name2));
            throw mapE;
        }
    }

    protected void serializeFieldsFiltered(Object bean, JsonGenerator jgen, SerializerProvider provider) throws IOException {
        BeanPropertyWriter[] props;
        if (this._filteredProps != null && provider.getSerializationView() != null) {
            props = this._filteredProps;
        } else {
            props = this._props;
        }
        BeanPropertyFilter filter = findFilter(provider);
        if (filter == null) {
            serializeFields(bean, jgen, provider);
            return;
        }
        int i = 0;
        try {
            int len = props.length;
            while (i < len) {
                BeanPropertyWriter prop = props[i];
                if (prop != null) {
                    filter.serializeAsField(bean, jgen, provider, prop);
                }
                i++;
            }
            if (this._anyGetterWriter != null) {
                this._anyGetterWriter.getAndSerialize(bean, jgen, provider);
            }
        } catch (Exception e) {
            String name = i == props.length ? "[anySetter]" : props[i].getName();
            wrapAndThrow(provider, e, bean, name);
        } catch (StackOverflowError e2) {
            JsonMappingException mapE = new JsonMappingException("Infinite recursion (StackOverflowError)");
            String name2 = i == props.length ? "[anySetter]" : props[i].getName();
            mapE.prependPath(new JsonMappingException.Reference(bean, name2));
            throw mapE;
        }
    }

    protected BeanPropertyFilter findFilter(SerializerProvider provider) throws JsonMappingException {
        Object filterId = this._propertyFilterId;
        FilterProvider filters = provider.getFilterProvider();
        if (filters == null) {
            throw new JsonMappingException("Can not resolve BeanPropertyFilter with id '" + filterId + "'; no FilterProvider configured");
        }
        BeanPropertyFilter filter = filters.findFilter(filterId);
        return filter;
    }

    @Override // org.codehaus.jackson.map.ser.std.SerializerBase, org.codehaus.jackson.schema.SchemaAware
    public JsonNode getSchema(SerializerProvider provider, Type typeHint) throws JsonMappingException {
        ObjectNode o = createSchemaNode("object", true);
        ObjectNode propertiesNode = o.objectNode();
        for (int i = 0; i < this._props.length; i++) {
            BeanPropertyWriter prop = this._props[i];
            JavaType propType = prop.getSerializationType();
            Type hint = propType == null ? prop.getGenericPropertyType() : propType.getRawClass();
            Object serializer = prop.getSerializer();
            if (serializer == null) {
                Class<?> serType = prop.getRawSerializationType();
                if (serType == null) {
                    serType = prop.getPropertyType();
                }
                serializer = provider.findValueSerializer(serType, prop);
            }
            JsonNode schemaNode = serializer instanceof SchemaAware ? ((SchemaAware) serializer).getSchema(provider, hint) : JsonSchema.getDefaultSchemaNode();
            propertiesNode.put(prop.getName(), schemaNode);
        }
        o.put("properties", propertiesNode);
        return o;
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0040 A[PHI: r6
      0x0040: PHI (r6v1 'type' org.codehaus.jackson.type.JavaType) = (r6v0 'type' org.codehaus.jackson.type.JavaType), (r6v2 'type' org.codehaus.jackson.type.JavaType) binds: [B:12:0x0020, B:14:0x002e] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // org.codehaus.jackson.map.ResolvableSerializer
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void resolve(org.codehaus.jackson.map.SerializerProvider r12) throws org.codehaus.jackson.map.JsonMappingException {
        /*
            r11 = this;
            org.codehaus.jackson.map.ser.BeanPropertyWriter[] r9 = r11._filteredProps
            if (r9 != 0) goto L18
            r0 = 0
        L5:
            r1 = 0
            org.codehaus.jackson.map.ser.BeanPropertyWriter[] r9 = r11._props
            int r2 = r9.length
        L9:
            if (r1 >= r2) goto L7a
            org.codehaus.jackson.map.ser.BeanPropertyWriter[] r9 = r11._props
            r3 = r9[r1]
            boolean r9 = r3.hasSerializer()
            if (r9 == 0) goto L1c
        L15:
            int r1 = r1 + 1
            goto L9
        L18:
            org.codehaus.jackson.map.ser.BeanPropertyWriter[] r9 = r11._filteredProps
            int r0 = r9.length
            goto L5
        L1c:
            org.codehaus.jackson.type.JavaType r6 = r3.getSerializationType()
            if (r6 != 0) goto L40
            java.lang.reflect.Type r9 = r3.getGenericPropertyType()
            org.codehaus.jackson.type.JavaType r6 = r12.constructType(r9)
            boolean r9 = r6.isFinal()
            if (r9 != 0) goto L40
            boolean r9 = r6.isContainerType()
            if (r9 != 0) goto L3c
            int r9 = r6.containedTypeCount()
            if (r9 <= 0) goto L15
        L3c:
            r3.setNonTrivialBaseType(r6)
            goto L15
        L40:
            org.codehaus.jackson.map.JsonSerializer r4 = r12.findValueSerializer(r6, r3)
            boolean r9 = r6.isContainerType()
            if (r9 == 0) goto L61
            org.codehaus.jackson.type.JavaType r9 = r6.getContentType()
            java.lang.Object r7 = r9.getTypeHandler()
            org.codehaus.jackson.map.TypeSerializer r7 = (org.codehaus.jackson.map.TypeSerializer) r7
            if (r7 == 0) goto L61
            boolean r9 = r4 instanceof org.codehaus.jackson.map.ser.std.ContainerSerializerBase
            if (r9 == 0) goto L61
            org.codehaus.jackson.map.ser.std.ContainerSerializerBase r4 = (org.codehaus.jackson.map.ser.std.ContainerSerializerBase) r4
            org.codehaus.jackson.map.ser.std.ContainerSerializerBase r5 = r4.withValueTypeSerializer(r7)
            r4 = r5
        L61:
            org.codehaus.jackson.map.ser.BeanPropertyWriter r3 = r3.withSerializer(r4)
            org.codehaus.jackson.map.ser.BeanPropertyWriter[] r9 = r11._props
            r9[r1] = r3
            if (r1 >= r0) goto L15
            org.codehaus.jackson.map.ser.BeanPropertyWriter[] r9 = r11._filteredProps
            r8 = r9[r1]
            if (r8 == 0) goto L15
            org.codehaus.jackson.map.ser.BeanPropertyWriter[] r9 = r11._filteredProps
            org.codehaus.jackson.map.ser.BeanPropertyWriter r10 = r8.withSerializer(r4)
            r9[r1] = r10
            goto L15
        L7a:
            org.codehaus.jackson.map.ser.AnyGetterWriter r9 = r11._anyGetterWriter
            if (r9 == 0) goto L83
            org.codehaus.jackson.map.ser.AnyGetterWriter r9 = r11._anyGetterWriter
            r9.resolve(r12)
        L83:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: org.codehaus.jackson.map.ser.std.BeanSerializerBase.resolve(org.codehaus.jackson.map.SerializerProvider):void");
    }
}
