package org.codehaus.jackson.node;

import java.math.BigDecimal;
import java.math.BigInteger;
import org.codehaus.jackson.JsonParser;

/* JADX INFO: loaded from: classes.dex */
public abstract class NumericNode extends ValueNode {
    @Override // org.codehaus.jackson.JsonNode
    public abstract String asText();

    @Override // org.codehaus.jackson.JsonNode
    public abstract BigInteger getBigIntegerValue();

    @Override // org.codehaus.jackson.JsonNode
    public abstract BigDecimal getDecimalValue();

    @Override // org.codehaus.jackson.JsonNode
    public abstract double getDoubleValue();

    @Override // org.codehaus.jackson.JsonNode
    public abstract int getIntValue();

    @Override // org.codehaus.jackson.JsonNode
    public abstract long getLongValue();

    @Override // org.codehaus.jackson.node.BaseJsonNode, org.codehaus.jackson.JsonNode
    public abstract JsonParser.NumberType getNumberType();

    @Override // org.codehaus.jackson.JsonNode
    public abstract Number getNumberValue();

    protected NumericNode() {
    }

    @Override // org.codehaus.jackson.JsonNode
    public final boolean isNumber() {
        return true;
    }

    @Override // org.codehaus.jackson.JsonNode
    public int asInt() {
        return getIntValue();
    }

    @Override // org.codehaus.jackson.JsonNode
    public int asInt(int defaultValue) {
        return getIntValue();
    }

    @Override // org.codehaus.jackson.JsonNode
    public long asLong() {
        return getLongValue();
    }

    @Override // org.codehaus.jackson.JsonNode
    public long asLong(long defaultValue) {
        return getLongValue();
    }

    @Override // org.codehaus.jackson.JsonNode
    public double asDouble() {
        return getDoubleValue();
    }

    @Override // org.codehaus.jackson.JsonNode
    public double asDouble(double defaultValue) {
        return getDoubleValue();
    }
}
