package org.codehaus.jackson.map.deser.std;

import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.JsonToken;
import org.codehaus.jackson.map.DeserializationContext;
import org.codehaus.jackson.map.JsonDeserializer;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.deser.BeanDeserializer;
import org.codehaus.jackson.map.deser.SettableBeanProperty;

/* JADX INFO: loaded from: classes.dex */
public class ThrowableDeserializer extends BeanDeserializer {
    protected static final String PROP_NAME_MESSAGE = "message";

    public ThrowableDeserializer(BeanDeserializer baseDeserializer) {
        super(baseDeserializer);
    }

    protected ThrowableDeserializer(BeanDeserializer src, boolean ignoreAllUnknown) {
        super(src, ignoreAllUnknown);
    }

    @Override // org.codehaus.jackson.map.deser.BeanDeserializer, org.codehaus.jackson.map.JsonDeserializer
    public JsonDeserializer<Object> unwrappingDeserializer() {
        return getClass() != ThrowableDeserializer.class ? this : new ThrowableDeserializer(this, true);
    }

    @Override // org.codehaus.jackson.map.deser.BeanDeserializer
    public Object deserializeFromObject(JsonParser jp, DeserializationContext ctxt) throws Exception {
        Object throwable;
        if (this._propertyBasedCreator != null) {
            return _deserializeUsingPropertyBased(jp, ctxt);
        }
        if (this._delegateDeserializer != null) {
            return this._valueInstantiator.createUsingDelegate(this._delegateDeserializer.deserialize(jp, ctxt));
        }
        if (this._beanType.isAbstract()) {
            throw JsonMappingException.from(jp, "Can not instantiate abstract type " + this._beanType + " (need to add/enable type information?)");
        }
        boolean hasStringCreator = this._valueInstantiator.canCreateFromString();
        boolean hasDefaultCtor = this._valueInstantiator.canCreateUsingDefault();
        if (!hasStringCreator && !hasDefaultCtor) {
            throw new JsonMappingException("Can not deserialize Throwable of type " + this._beanType + " without having a default contructor, a single-String-arg constructor; or explicit @JsonCreator");
        }
        Object throwable2 = null;
        Object[] pending = null;
        int pendingIx = 0;
        while (jp.getCurrentToken() != JsonToken.END_OBJECT) {
            String propName = jp.getCurrentName();
            SettableBeanProperty prop = this._beanProperties.find(propName);
            jp.nextToken();
            if (prop != null) {
                if (throwable2 != null) {
                    prop.deserializeAndSet(jp, ctxt, throwable2);
                } else {
                    if (pending == null) {
                        int len = this._beanProperties.size();
                        pending = new Object[len + len];
                    }
                    int pendingIx2 = pendingIx + 1;
                    pending[pendingIx] = prop;
                    pendingIx = pendingIx2 + 1;
                    pending[pendingIx2] = prop.deserialize(jp, ctxt);
                }
            } else if (PROP_NAME_MESSAGE.equals(propName) && hasStringCreator) {
                throwable2 = this._valueInstantiator.createFromString(jp.getText());
                if (pending != null) {
                    int len2 = pendingIx;
                    for (int i = 0; i < len2; i += 2) {
                        ((SettableBeanProperty) pending[i]).set(throwable2, pending[i + 1]);
                    }
                    pending = null;
                }
            } else if (this._ignorableProps != null && this._ignorableProps.contains(propName)) {
                jp.skipChildren();
            } else if (this._anySetter != null) {
                this._anySetter.deserializeAndSet(jp, ctxt, throwable2, propName);
            } else {
                handleUnknownProperty(jp, ctxt, throwable2, propName);
            }
            jp.nextToken();
        }
        if (throwable2 == null) {
            if (hasStringCreator) {
                throwable = this._valueInstantiator.createFromString(null);
            } else {
                throwable = this._valueInstantiator.createUsingDefault();
            }
            if (pending != null) {
                int len3 = pendingIx;
                for (int i2 = 0; i2 < len3; i2 += 2) {
                    ((SettableBeanProperty) pending[i2]).set(throwable, pending[i2 + 1]);
                }
                return throwable;
            }
            return throwable;
        }
        return throwable2;
    }
}
