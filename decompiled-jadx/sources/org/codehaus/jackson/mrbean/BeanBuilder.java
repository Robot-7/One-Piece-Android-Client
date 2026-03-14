package org.codehaus.jackson.mrbean;

import java.lang.reflect.Method;
import java.util.LinkedHashMap;
import java.util.Map;
import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.type.TypeFactory;
import org.codehaus.jackson.org.objectweb.asm.ClassWriter;
import org.codehaus.jackson.org.objectweb.asm.FieldVisitor;
import org.codehaus.jackson.org.objectweb.asm.MethodVisitor;
import org.codehaus.jackson.org.objectweb.asm.Opcodes;
import org.codehaus.jackson.org.objectweb.asm.Type;
import org.codehaus.jackson.type.JavaType;

/* JADX INFO: loaded from: classes.dex */
public class BeanBuilder {
    protected final Class<?> _implementedType;
    protected final TypeFactory _typeFactory;
    protected Map<String, Property> _beanProperties = new LinkedHashMap();
    protected LinkedHashMap<String, Method> _unsupportedMethods = new LinkedHashMap<>();

    public BeanBuilder(DeserializationConfig config, Class<?> implType) {
        this._implementedType = implType;
        this._typeFactory = config.getTypeFactory();
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0061  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public org.codehaus.jackson.mrbean.BeanBuilder implement(boolean r13) {
        /*
            r12 = this;
            java.util.ArrayList r5 = new java.util.ArrayList
            r5.<init>()
            java.lang.Class<?> r9 = r12._implementedType
            r5.add(r9)
            java.lang.Class<?> r9 = r12._implementedType
            java.lang.Class<java.lang.Object> r10 = java.lang.Object.class
            org.codehaus.jackson.mrbean.BeanUtil.findSuperTypes(r9, r10, r5)
            java.util.Iterator r2 = r5.iterator()
        L15:
            boolean r9 = r2.hasNext()
            if (r9 == 0) goto L96
            java.lang.Object r4 = r2.next()
            java.lang.Class r4 = (java.lang.Class) r4
            java.lang.reflect.Method[] r1 = r4.getDeclaredMethods()
            int r6 = r1.length
            r3 = 0
        L27:
            if (r3 >= r6) goto L15
            r7 = r1[r3]
            java.lang.String r8 = r7.getName()
            java.lang.Class[] r9 = r7.getParameterTypes()
            int r0 = r9.length
            if (r0 != 0) goto L52
            java.lang.String r9 = "get"
            boolean r9 = r8.startsWith(r9)
            if (r9 != 0) goto L4c
            java.lang.String r9 = "is"
            boolean r9 = r8.startsWith(r9)
            if (r9 == 0) goto L61
            boolean r9 = returnsBoolean(r7)
            if (r9 == 0) goto L61
        L4c:
            r12.addGetter(r7)
        L4f:
            int r3 = r3 + 1
            goto L27
        L52:
            r9 = 1
            if (r0 != r9) goto L61
            java.lang.String r9 = "set"
            boolean r9 = r8.startsWith(r9)
            if (r9 == 0) goto L61
            r12.addSetter(r7)
            goto L4f
        L61:
            boolean r9 = org.codehaus.jackson.mrbean.BeanUtil.isConcrete(r7)
            if (r9 != 0) goto L4f
            java.util.LinkedHashMap<java.lang.String, java.lang.reflect.Method> r9 = r12._unsupportedMethods
            boolean r9 = r9.containsKey(r8)
            if (r9 != 0) goto L4f
            if (r13 == 0) goto L90
            java.lang.IllegalArgumentException r9 = new java.lang.IllegalArgumentException
            java.lang.StringBuilder r10 = new java.lang.StringBuilder
            r10.<init>()
            java.lang.String r11 = "Unrecognized abstract method '"
            java.lang.StringBuilder r10 = r10.append(r11)
            java.lang.StringBuilder r10 = r10.append(r8)
            java.lang.String r11 = "' (not a getter or setter) -- to avoid exception, disable AbstractTypeMaterializer.Feature.FAIL_ON_UNMATERIALIZED_METHOD"
            java.lang.StringBuilder r10 = r10.append(r11)
            java.lang.String r10 = r10.toString()
            r9.<init>(r10)
            throw r9
        L90:
            java.util.LinkedHashMap<java.lang.String, java.lang.reflect.Method> r9 = r12._unsupportedMethods
            r9.put(r8, r7)
            goto L4f
        L96:
            return r12
        */
        throw new UnsupportedOperationException("Method not decompiled: org.codehaus.jackson.mrbean.BeanBuilder.implement(boolean):org.codehaus.jackson.mrbean.BeanBuilder");
    }

    public byte[] build(String className) {
        String superName;
        ClassWriter cw = new ClassWriter(1);
        String internalClass = getInternalClassName(className);
        String implName = getInternalClassName(this._implementedType.getName());
        if (this._implementedType.isInterface()) {
            superName = "java/lang/Object";
            cw.visit(49, 33, internalClass, null, "java/lang/Object", new String[]{implName});
        } else {
            superName = implName;
            cw.visit(49, 33, internalClass, null, implName, null);
        }
        cw.visitSource(className + ".java", null);
        generateDefaultConstructor(cw, superName);
        for (Property prop : this._beanProperties.values()) {
            TypeDescription type = prop.selectType(this._typeFactory);
            createField(cw, prop, type);
            if (!prop.hasConcreteGetter()) {
                createGetter(cw, internalClass, prop, type);
            }
            if (!prop.hasConcreteSetter()) {
                createSetter(cw, internalClass, prop, type);
            }
        }
        for (Method m : this._unsupportedMethods.values()) {
            createUnimplementedMethod(cw, internalClass, m);
        }
        cw.visitEnd();
        return cw.toByteArray();
    }

    private static String getPropertyName(String methodName) {
        int prefixLen = methodName.startsWith("is") ? 2 : 3;
        String body = methodName.substring(prefixLen);
        StringBuilder sb = new StringBuilder(body);
        sb.setCharAt(0, Character.toLowerCase(body.charAt(0)));
        return sb.toString();
    }

    private static String buildGetterName(String fieldName) {
        return "get" + fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
    }

    private static String buildSetterName(String fieldName) {
        return "set" + fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
    }

    private static String getInternalClassName(String className) {
        return className.replace(".", "/");
    }

    private void addGetter(Method m) {
        Property prop = findProperty(getPropertyName(m.getName()));
        if (prop.getGetter() == null) {
            prop.setGetter(m);
        }
    }

    private void addSetter(Method m) {
        Property prop = findProperty(getPropertyName(m.getName()));
        if (prop.getSetter() == null) {
            prop.setSetter(m);
        }
    }

    private Property findProperty(String propName) {
        Property prop = this._beanProperties.get(propName);
        if (prop == null) {
            Property prop2 = new Property(propName);
            this._beanProperties.put(propName, prop2);
            return prop2;
        }
        return prop;
    }

    private static final boolean returnsBoolean(Method m) {
        Class<?> rt = m.getReturnType();
        return rt == Boolean.class || rt == Boolean.TYPE;
    }

    private static void generateDefaultConstructor(ClassWriter cw, String superName) {
        MethodVisitor mv = cw.visitMethod(1, "<init>", "()V", null, null);
        mv.visitCode();
        mv.visitVarInsn(25, 0);
        mv.visitMethodInsn(Opcodes.INVOKESPECIAL, superName, "<init>", "()V");
        mv.visitInsn(Opcodes.RETURN);
        mv.visitMaxs(0, 0);
        mv.visitEnd();
    }

    private static void createField(ClassWriter cw, Property prop, TypeDescription type) {
        String sig = type.hasGenerics() ? type.genericSignature() : null;
        String desc = type.erasedSignature();
        FieldVisitor fv = cw.visitField(1, prop.getFieldName(), desc, sig, null);
        fv.visitEnd();
    }

    private static void createSetter(ClassWriter cw, String internalClassName, Property prop, TypeDescription propertyType) {
        String desc;
        String methodName;
        Method setter = prop.getSetter();
        if (setter != null) {
            desc = Type.getMethodDescriptor(setter);
            methodName = setter.getName();
        } else {
            desc = "(" + propertyType.erasedSignature() + ")V";
            methodName = buildSetterName(prop.getName());
        }
        String sig = propertyType.hasGenerics() ? "(" + propertyType.genericSignature() + ")V" : null;
        MethodVisitor mv = cw.visitMethod(1, methodName, desc, sig, null);
        mv.visitCode();
        mv.visitVarInsn(25, 0);
        mv.visitVarInsn(propertyType.getLoadOpcode(), 1);
        mv.visitFieldInsn(Opcodes.PUTFIELD, internalClassName, prop.getFieldName(), propertyType.erasedSignature());
        mv.visitInsn(Opcodes.RETURN);
        mv.visitMaxs(0, 0);
        mv.visitEnd();
    }

    private static void createGetter(ClassWriter cw, String internalClassName, Property prop, TypeDescription propertyType) {
        String desc;
        String methodName;
        Method getter = prop.getGetter();
        if (getter != null) {
            desc = Type.getMethodDescriptor(getter);
            methodName = getter.getName();
        } else {
            desc = "()" + propertyType.erasedSignature();
            methodName = buildGetterName(prop.getName());
        }
        String sig = propertyType.hasGenerics() ? "()" + propertyType.genericSignature() : null;
        MethodVisitor mv = cw.visitMethod(1, methodName, desc, sig, null);
        mv.visitCode();
        mv.visitVarInsn(25, 0);
        mv.visitFieldInsn(Opcodes.GETFIELD, internalClassName, prop.getFieldName(), propertyType.erasedSignature());
        mv.visitInsn(propertyType.getReturnOpcode());
        mv.visitMaxs(0, 0);
        mv.visitEnd();
    }

    private static void createUnimplementedMethod(ClassWriter cw, String internalClassName, Method method) {
        String exceptionName = getInternalClassName(UnsupportedOperationException.class.getName());
        String sig = Type.getMethodDescriptor(method);
        String name = method.getName();
        MethodVisitor mv = cw.visitMethod(1, name, sig, null, null);
        mv.visitTypeInsn(Opcodes.NEW, exceptionName);
        mv.visitInsn(89);
        mv.visitLdcInsn("Unimplemented method '" + name + "' (not a setter/getter, could not materialize)");
        mv.visitMethodInsn(Opcodes.INVOKESPECIAL, exceptionName, "<init>", "(Ljava/lang/String;)V");
        mv.visitInsn(191);
        mv.visitMaxs(0, 0);
        mv.visitEnd();
    }

    private static class Property {
        protected final String _fieldName;
        protected Method _getter;
        protected final String _name;
        protected Method _setter;

        public Property(String name) {
            this._name = name;
            this._fieldName = "_" + name;
        }

        public String getName() {
            return this._name;
        }

        public void setGetter(Method m) {
            this._getter = m;
        }

        public void setSetter(Method m) {
            this._setter = m;
        }

        public Method getGetter() {
            return this._getter;
        }

        public Method getSetter() {
            return this._setter;
        }

        public String getFieldName() {
            return this._fieldName;
        }

        public boolean hasConcreteGetter() {
            return this._getter != null && BeanUtil.isConcrete(this._getter);
        }

        public boolean hasConcreteSetter() {
            return this._setter != null && BeanUtil.isConcrete(this._setter);
        }

        private TypeDescription getterType(TypeFactory tf) {
            Class<?> context = this._getter.getDeclaringClass();
            return new TypeDescription(tf.constructType(this._getter.getGenericReturnType(), context));
        }

        private TypeDescription setterType(TypeFactory tf) {
            Class<?> context = this._setter.getDeclaringClass();
            return new TypeDescription(tf.constructType(this._setter.getGenericParameterTypes()[0], context));
        }

        public TypeDescription selectType(TypeFactory tf) {
            if (this._getter == null) {
                return setterType(tf);
            }
            if (this._setter == null) {
                return getterType(tf);
            }
            TypeDescription st = setterType(tf);
            TypeDescription gt = getterType(tf);
            TypeDescription specificType = TypeDescription.moreSpecificType(st, gt);
            if (specificType == null) {
                throw new IllegalArgumentException("Invalid property '" + getName() + "': incompatible types for getter/setter (" + gt + " vs " + st + ")");
            }
            return specificType;
        }
    }

    private static class TypeDescription {
        private final Type _asmType;
        private JavaType _jacksonType;

        public TypeDescription(JavaType type) {
            this._jacksonType = type;
            this._asmType = Type.getType(type.getRawClass());
        }

        public Class<?> getRawClass() {
            return this._jacksonType.getRawClass();
        }

        public String erasedSignature() {
            return this._jacksonType.getErasedSignature();
        }

        public String genericSignature() {
            return this._jacksonType.getGenericSignature();
        }

        public boolean hasGenerics() {
            return this._jacksonType.hasGenericTypes();
        }

        public int getLoadOpcode() {
            return this._asmType.getOpcode(21);
        }

        public int getReturnOpcode() {
            return this._asmType.getOpcode(Opcodes.IRETURN);
        }

        public String toString() {
            return this._jacksonType.toString();
        }

        public static TypeDescription moreSpecificType(TypeDescription desc1, TypeDescription desc2) {
            Class<?> c1 = desc1.getRawClass();
            Class<?> c2 = desc2.getRawClass();
            if (!c1.isAssignableFrom(c2)) {
                if (c2.isAssignableFrom(c1)) {
                    return desc1;
                }
                return null;
            }
            return desc2;
        }
    }
}
