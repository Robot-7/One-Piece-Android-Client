package org.codehaus.jackson.map.deser.impl;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.map.DeserializationContext;
import org.codehaus.jackson.map.JsonDeserializer;
import org.codehaus.jackson.map.deser.SettableBeanProperty;
import org.codehaus.jackson.map.deser.ValueInstantiator;
import org.codehaus.jackson.map.util.ClassUtil;

/* JADX INFO: loaded from: classes.dex */
public final class PropertyBasedCreator {
    protected final Object[] _defaultValues;
    protected final HashMap<String, SettableBeanProperty> _properties = new HashMap<>();
    protected final SettableBeanProperty[] _propertiesWithInjectables;
    protected final ValueInstantiator _valueInstantiator;

    public PropertyBasedCreator(ValueInstantiator valueInstantiator) {
        this._valueInstantiator = valueInstantiator;
        Object[] defValues = null;
        SettableBeanProperty[] creatorProps = valueInstantiator.getFromObjectArguments();
        SettableBeanProperty[] propertiesWithInjectables = null;
        int len = creatorProps.length;
        for (int i = 0; i < len; i++) {
            SettableBeanProperty prop = creatorProps[i];
            this._properties.put(prop.getName(), prop);
            if (prop.getType().isPrimitive()) {
                defValues = defValues == null ? new Object[len] : defValues;
                defValues[i] = ClassUtil.defaultValue(prop.getType().getRawClass());
            }
            Object injectableValueId = prop.getInjectableValueId();
            if (injectableValueId != null) {
                propertiesWithInjectables = propertiesWithInjectables == null ? new SettableBeanProperty[len] : propertiesWithInjectables;
                propertiesWithInjectables[i] = prop;
            }
        }
        this._defaultValues = defValues;
        this._propertiesWithInjectables = propertiesWithInjectables;
    }

    public Collection<SettableBeanProperty> getCreatorProperties() {
        return this._properties.values();
    }

    public SettableBeanProperty findCreatorProperty(String name) {
        return this._properties.get(name);
    }

    public void assignDeserializer(SettableBeanProperty prop, JsonDeserializer<Object> deser) {
        SettableBeanProperty prop2 = prop.withValueDeserializer(deser);
        this._properties.put(prop2.getName(), prop2);
    }

    public PropertyValueBuffer startBuilding(JsonParser jp, DeserializationContext ctxt) {
        PropertyValueBuffer buffer = new PropertyValueBuffer(jp, ctxt, this._properties.size());
        if (this._propertiesWithInjectables != null) {
            buffer.inject(this._propertiesWithInjectables);
        }
        return buffer;
    }

    public Object build(PropertyValueBuffer buffer) throws IOException {
        Object bean = this._valueInstantiator.createFromObjectWith(buffer.getParameters(this._defaultValues));
        for (PropertyValue pv = buffer.buffered(); pv != null; pv = pv.next) {
            pv.assign(bean);
        }
        return bean;
    }
}
