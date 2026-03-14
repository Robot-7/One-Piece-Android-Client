package org.codehaus.jackson.map.introspect;

import org.codehaus.jackson.map.BeanPropertyDefinition;

/* JADX INFO: loaded from: classes.dex */
public class POJOPropertyBuilder extends BeanPropertyDefinition implements Comparable<POJOPropertyBuilder> {
    protected Node<AnnotatedParameter> _ctorParameters;
    protected Node<AnnotatedField> _fields;
    protected Node<AnnotatedMethod> _getters;
    protected final String _internalName;
    protected final String _name;
    protected Node<AnnotatedMethod> _setters;

    public POJOPropertyBuilder(String internalName) {
        this._internalName = internalName;
        this._name = internalName;
    }

    public POJOPropertyBuilder(POJOPropertyBuilder src, String newName) {
        this._internalName = src._internalName;
        this._name = newName;
        this._fields = src._fields;
        this._ctorParameters = src._ctorParameters;
        this._getters = src._getters;
        this._setters = src._setters;
    }

    public POJOPropertyBuilder withName(String newName) {
        return new POJOPropertyBuilder(this, newName);
    }

    @Override // java.lang.Comparable
    public int compareTo(POJOPropertyBuilder other) {
        if (this._ctorParameters != null) {
            if (other._ctorParameters == null) {
                return -1;
            }
        } else if (other._ctorParameters != null) {
            return 1;
        }
        return getName().compareTo(other.getName());
    }

    @Override // org.codehaus.jackson.map.BeanPropertyDefinition, org.codehaus.jackson.map.util.Named
    public String getName() {
        return this._name;
    }

    @Override // org.codehaus.jackson.map.BeanPropertyDefinition
    public String getInternalName() {
        return this._internalName;
    }

    @Override // org.codehaus.jackson.map.BeanPropertyDefinition
    public boolean hasGetter() {
        return this._getters != null;
    }

    @Override // org.codehaus.jackson.map.BeanPropertyDefinition
    public boolean hasSetter() {
        return this._setters != null;
    }

    @Override // org.codehaus.jackson.map.BeanPropertyDefinition
    public boolean hasField() {
        return this._fields != null;
    }

    @Override // org.codehaus.jackson.map.BeanPropertyDefinition
    public boolean hasConstructorParameter() {
        return this._ctorParameters != null;
    }

    @Override // org.codehaus.jackson.map.BeanPropertyDefinition
    public AnnotatedMember getAccessor() {
        AnnotatedMember m = getGetter();
        if (m == null) {
            return getField();
        }
        return m;
    }

    @Override // org.codehaus.jackson.map.BeanPropertyDefinition
    public AnnotatedMember getMutator() {
        AnnotatedMember m = getConstructorParameter();
        if (m == null) {
            AnnotatedMember m2 = getSetter();
            if (m2 == null) {
                return getField();
            }
            return m2;
        }
        return m;
    }

    @Override // org.codehaus.jackson.map.BeanPropertyDefinition
    public boolean couldSerialize() {
        return (this._getters == null && this._fields == null) ? false : true;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // org.codehaus.jackson.map.BeanPropertyDefinition
    public AnnotatedMethod getGetter() {
        if (this._getters == null) {
            return null;
        }
        AnnotatedMethod getter = this._getters.value;
        for (Node node = this._getters.next; node != null; node = node.next) {
            AnnotatedMethod nextGetter = (AnnotatedMethod) node.value;
            Class<?> getterClass = getter.getDeclaringClass();
            Class<?> nextClass = nextGetter.getDeclaringClass();
            if (getterClass != nextClass) {
                if (getterClass.isAssignableFrom(nextClass)) {
                    getter = nextGetter;
                } else if (!nextClass.isAssignableFrom(getterClass)) {
                }
            }
            throw new IllegalArgumentException("Conflicting getter definitions for property \"" + getName() + "\": " + getter.getFullName() + " vs " + nextGetter.getFullName());
        }
        return getter;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // org.codehaus.jackson.map.BeanPropertyDefinition
    public AnnotatedMethod getSetter() {
        if (this._setters == null) {
            return null;
        }
        AnnotatedMethod setter = this._setters.value;
        for (Node node = this._setters.next; node != null; node = node.next) {
            AnnotatedMethod nextSetter = (AnnotatedMethod) node.value;
            Class<?> setterClass = setter.getDeclaringClass();
            Class<?> nextClass = nextSetter.getDeclaringClass();
            if (setterClass != nextClass) {
                if (setterClass.isAssignableFrom(nextClass)) {
                    setter = nextSetter;
                } else if (!nextClass.isAssignableFrom(setterClass)) {
                }
            }
            throw new IllegalArgumentException("Conflicting setter definitions for property \"" + getName() + "\": " + setter.getFullName() + " vs " + nextSetter.getFullName());
        }
        return setter;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // org.codehaus.jackson.map.BeanPropertyDefinition
    public AnnotatedField getField() {
        if (this._fields == null) {
            return null;
        }
        AnnotatedField field = this._fields.value;
        for (Node node = this._fields.next; node != null; node = node.next) {
            AnnotatedField nextField = (AnnotatedField) node.value;
            Class<?> fieldClass = field.getDeclaringClass();
            Class<?> nextClass = nextField.getDeclaringClass();
            if (fieldClass != nextClass) {
                if (fieldClass.isAssignableFrom(nextClass)) {
                    field = nextField;
                } else if (!nextClass.isAssignableFrom(fieldClass)) {
                }
            }
            throw new IllegalArgumentException("Multiple fields representing property \"" + getName() + "\": " + field.getFullName() + " vs " + nextField.getFullName());
        }
        return field;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // org.codehaus.jackson.map.BeanPropertyDefinition
    public AnnotatedParameter getConstructorParameter() {
        if (this._ctorParameters == null) {
            return null;
        }
        Node node = this._ctorParameters;
        while (!(((AnnotatedParameter) node.value).getOwner() instanceof AnnotatedConstructor)) {
            node = node.next;
            if (node == null) {
                return this._ctorParameters.value;
            }
        }
        return (AnnotatedParameter) node.value;
    }

    public void addField(AnnotatedField a, String ename, boolean visible, boolean ignored) {
        this._fields = new Node<>(a, this._fields, ename, visible, ignored);
    }

    public void addCtor(AnnotatedParameter a, String ename, boolean visible, boolean ignored) {
        this._ctorParameters = new Node<>(a, this._ctorParameters, ename, visible, ignored);
    }

    public void addGetter(AnnotatedMethod a, String ename, boolean visible, boolean ignored) {
        this._getters = new Node<>(a, this._getters, ename, visible, ignored);
    }

    public void addSetter(AnnotatedMethod a, String ename, boolean visible, boolean ignored) {
        this._setters = new Node<>(a, this._setters, ename, visible, ignored);
    }

    public void addAll(POJOPropertyBuilder src) {
        this._fields = merge(this._fields, src._fields);
        this._ctorParameters = merge(this._ctorParameters, src._ctorParameters);
        this._getters = merge(this._getters, src._getters);
        this._setters = merge(this._setters, src._setters);
    }

    private static <T> Node<T> merge(Node<T> chain1, Node<T> chain2) {
        if (chain1 == null) {
            return chain2;
        }
        return chain2 == null ? chain1 : chain1.append(chain2);
    }

    public void removeIgnored() {
        this._fields = _removeIgnored(this._fields);
        this._getters = _removeIgnored(this._getters);
        this._setters = _removeIgnored(this._setters);
        this._ctorParameters = _removeIgnored(this._ctorParameters);
    }

    public void removeNonVisible() {
        this._getters = _removeNonVisible(this._getters);
        this._ctorParameters = _removeNonVisible(this._ctorParameters);
        if (this._getters == null) {
            this._fields = _removeNonVisible(this._fields);
            this._setters = _removeNonVisible(this._setters);
        }
    }

    public void trimByVisibility() {
        this._fields = _trimByVisibility(this._fields);
        this._getters = _trimByVisibility(this._getters);
        this._setters = _trimByVisibility(this._setters);
        this._ctorParameters = _trimByVisibility(this._ctorParameters);
    }

    public void mergeAnnotations(boolean forSerialization) {
        if (forSerialization) {
            if (this._getters != null) {
                AnnotationMap ann = _mergeAnnotations(0, this._getters, this._fields, this._ctorParameters, this._setters);
                this._getters = this._getters.withValue(this._getters.value.withAnnotations(ann));
                return;
            } else {
                if (this._fields != null) {
                    AnnotationMap ann2 = _mergeAnnotations(0, this._fields, this._ctorParameters, this._setters);
                    this._fields = this._fields.withValue(this._fields.value.withAnnotations(ann2));
                    return;
                }
                return;
            }
        }
        if (this._ctorParameters != null) {
            AnnotationMap ann3 = _mergeAnnotations(0, this._ctorParameters, this._setters, this._fields, this._getters);
            this._ctorParameters = this._ctorParameters.withValue(this._ctorParameters.value.withAnnotations(ann3));
        } else if (this._setters != null) {
            AnnotationMap ann4 = _mergeAnnotations(0, this._setters, this._fields, this._getters);
            this._setters = this._setters.withValue(this._setters.value.withAnnotations(ann4));
        } else if (this._fields != null) {
            AnnotationMap ann5 = _mergeAnnotations(0, this._fields, this._getters);
            this._fields = this._fields.withValue(this._fields.value.withAnnotations(ann5));
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    private AnnotationMap _mergeAnnotations(int index, Node<? extends AnnotatedMember>... nodes) {
        AnnotationMap ann = ((AnnotatedMember) nodes[index].value).getAllAnnotations();
        do {
            index++;
            if (index >= nodes.length) {
                return ann;
            }
        } while (nodes[index] == null);
        return AnnotationMap.merge(ann, _mergeAnnotations(index, nodes));
    }

    private <T> Node<T> _removeIgnored(Node<T> node) {
        return node == null ? node : node.withoutIgnored();
    }

    private <T> Node<T> _removeNonVisible(Node<T> node) {
        return node == null ? node : node.withoutNonVisible();
    }

    private <T> Node<T> _trimByVisibility(Node<T> node) {
        return node == null ? node : node.trimByVisibility();
    }

    public boolean anyExplicitNames() {
        return _anyExplicitNames(this._fields) || _anyExplicitNames(this._getters) || _anyExplicitNames(this._setters) || _anyExplicitNames(this._ctorParameters);
    }

    private <T> boolean _anyExplicitNames(Node<T> n) {
        while (n != null) {
            if (n.explicitName == null || n.explicitName.length() <= 0) {
                n = n.next;
            } else {
                return true;
            }
        }
        return false;
    }

    public boolean anyVisible() {
        return _anyVisible(this._fields) || _anyVisible(this._getters) || _anyVisible(this._setters) || _anyVisible(this._ctorParameters);
    }

    private <T> boolean _anyVisible(Node<T> n) {
        while (n != null) {
            if (!n.isVisible) {
                n = n.next;
            } else {
                return true;
            }
        }
        return false;
    }

    public boolean anyIgnorals() {
        return _anyIgnorals(this._fields) || _anyIgnorals(this._getters) || _anyIgnorals(this._setters) || _anyIgnorals(this._ctorParameters);
    }

    private <T> boolean _anyIgnorals(Node<T> n) {
        while (n != null) {
            if (!n.isMarkedIgnored) {
                n = n.next;
            } else {
                return true;
            }
        }
        return false;
    }

    public String findNewName() {
        Node<? extends AnnotatedMember> renamed = findRenamed(this._fields, null);
        Node<? extends AnnotatedMember> renamed2 = findRenamed(this._ctorParameters, findRenamed(this._setters, findRenamed(this._getters, renamed)));
        if (renamed2 == null) {
            return null;
        }
        return renamed2.explicitName;
    }

    private Node<? extends AnnotatedMember> findRenamed(Node<? extends AnnotatedMember> node, Node<? extends AnnotatedMember> node2) {
        Node node3 = node;
        Node node4 = node2;
        while (node3 != null) {
            String str = node3.explicitName;
            if (str != null && !str.equals(this._name)) {
                if (node4 == null) {
                    node4 = node3;
                } else if (!str.equals(node4.explicitName)) {
                    throw new IllegalStateException("Conflicting property name definitions: '" + node4.explicitName + "' (for " + node4.value + ") vs '" + node3.explicitName + "' (for " + node3.value + ")");
                }
            }
            node3 = node3.next;
            node4 = node4;
        }
        return node4;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[Property '").append(this._name).append("'; ctors: ").append(this._ctorParameters).append(", field(s): ").append(this._fields).append(", getter(s): ").append(this._getters).append(", setter(s): ").append(this._setters);
        sb.append("]");
        return sb.toString();
    }

    private static final class Node<T> {
        public final String explicitName;
        public final boolean isMarkedIgnored;
        public final boolean isVisible;
        public final Node<T> next;
        public final T value;

        public Node(T v, Node<T> n, String explName, boolean visible, boolean ignored) {
            this.value = v;
            this.next = n;
            if (explName == null) {
                this.explicitName = null;
            } else {
                this.explicitName = explName.length() == 0 ? null : explName;
            }
            this.isVisible = visible;
            this.isMarkedIgnored = ignored;
        }

        public Node<T> withValue(T newValue) {
            return newValue == this.value ? this : new Node<>(newValue, this.next, this.explicitName, this.isVisible, this.isMarkedIgnored);
        }

        public Node<T> withNext(Node<T> newNext) {
            return newNext == this.next ? this : new Node<>(this.value, newNext, this.explicitName, this.isVisible, this.isMarkedIgnored);
        }

        public Node<T> withoutIgnored() {
            Node<T> newNext;
            if (!this.isMarkedIgnored) {
                return (this.next == null || (newNext = this.next.withoutIgnored()) == this.next) ? this : withNext(newNext);
            }
            if (this.next == null) {
                return null;
            }
            return this.next.withoutIgnored();
        }

        public Node<T> withoutNonVisible() {
            Node<T> newNext = this.next == null ? null : this.next.withoutNonVisible();
            return this.isVisible ? withNext(newNext) : newNext;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public Node<T> append(Node<T> appendable) {
            return this.next == null ? withNext(appendable) : withNext(this.next.append(appendable));
        }

        public Node<T> trimByVisibility() {
            if (this.next == null) {
                return this;
            }
            Node<T> newNext = this.next.trimByVisibility();
            if (this.explicitName != null) {
                if (newNext.explicitName == null) {
                    return withNext(null);
                }
                return withNext(newNext);
            }
            if (newNext.explicitName == null) {
                if (this.isVisible == newNext.isVisible) {
                    return withNext(newNext);
                }
                return this.isVisible ? withNext(null) : newNext;
            }
            return newNext;
        }

        public String toString() {
            String msg = this.value.toString() + "[visible=" + this.isVisible + "]";
            if (this.next != null) {
                return msg + ", " + this.next.toString();
            }
            return msg;
        }
    }
}
