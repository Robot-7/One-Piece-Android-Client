package org.codehaus.jackson.map.deser.std;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.map.DeserializationContext;
import org.codehaus.jackson.map.annotate.JacksonStdImpl;

/* JADX INFO: loaded from: classes.dex */
@JacksonStdImpl
public class CalendarDeserializer extends StdScalarDeserializer<Calendar> {
    protected final Class<? extends Calendar> _calendarClass;

    public CalendarDeserializer() {
        this(null);
    }

    public CalendarDeserializer(Class<? extends Calendar> cc) {
        super((Class<?>) Calendar.class);
        this._calendarClass = cc;
    }

    @Override // org.codehaus.jackson.map.JsonDeserializer
    public Calendar deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException {
        Date d = _parseDate(jp, ctxt);
        if (d == null) {
            return null;
        }
        if (this._calendarClass == null) {
            return ctxt.constructCalendar(d);
        }
        try {
            Calendar c = this._calendarClass.newInstance();
            c.setTimeInMillis(d.getTime());
            return c;
        } catch (Exception e) {
            throw ctxt.instantiationException(this._calendarClass, e);
        }
    }
}
