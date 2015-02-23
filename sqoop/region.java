// ORM class for region
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.Writable;
import org.apache.hadoop.mapred.lib.db.DBWritable;
import com.cloudera.sqoop.lib.JdbcWritableBridge;
import com.cloudera.sqoop.lib.DelimiterSet;
import com.cloudera.sqoop.lib.FieldFormatter;
import com.cloudera.sqoop.lib.RecordParser;
import com.cloudera.sqoop.lib.BooleanParser;
import com.cloudera.sqoop.lib.BlobRef;
import com.cloudera.sqoop.lib.ClobRef;
import com.cloudera.sqoop.lib.LargeObjectLoader;
import com.cloudera.sqoop.lib.SqoopRecord;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class region extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  protected ResultSet __cur_result_set;
  private Integer r_regionkey;
  public Integer get_r_regionkey() {
    return r_regionkey;
  }
  public void set_r_regionkey(Integer r_regionkey) {
    this.r_regionkey = r_regionkey;
  }
  public region with_r_regionkey(Integer r_regionkey) {
    this.r_regionkey = r_regionkey;
    return this;
  }
  private String r_name;
  public String get_r_name() {
    return r_name;
  }
  public void set_r_name(String r_name) {
    this.r_name = r_name;
  }
  public region with_r_name(String r_name) {
    this.r_name = r_name;
    return this;
  }
  private String r_comment;
  public String get_r_comment() {
    return r_comment;
  }
  public void set_r_comment(String r_comment) {
    this.r_comment = r_comment;
  }
  public region with_r_comment(String r_comment) {
    this.r_comment = r_comment;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof region)) {
      return false;
    }
    region that = (region) o;
    boolean equal = true;
    equal = equal && (this.r_regionkey == null ? that.r_regionkey == null : this.r_regionkey.equals(that.r_regionkey));
    equal = equal && (this.r_name == null ? that.r_name == null : this.r_name.equals(that.r_name));
    equal = equal && (this.r_comment == null ? that.r_comment == null : this.r_comment.equals(that.r_comment));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.r_regionkey = JdbcWritableBridge.readInteger(1, __dbResults);
    this.r_name = JdbcWritableBridge.readString(2, __dbResults);
    this.r_comment = JdbcWritableBridge.readString(3, __dbResults);
  }
  public void loadLargeObjects(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void write(PreparedStatement __dbStmt) throws SQLException {
    write(__dbStmt, 0);
  }

  public int write(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeInteger(r_regionkey, 1 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeString(r_name, 2 + __off, 1, __dbStmt);
    JdbcWritableBridge.writeString(r_comment, 3 + __off, 12, __dbStmt);
    return 3;
  }
  public void readFields(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.r_regionkey = null;
    } else {
    this.r_regionkey = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.r_name = null;
    } else {
    this.r_name = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.r_comment = null;
    } else {
    this.r_comment = Text.readString(__dataIn);
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.r_regionkey) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.r_regionkey);
    }
    if (null == this.r_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, r_name);
    }
    if (null == this.r_comment) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, r_comment);
    }
  }
  private final DelimiterSet __outputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  public String toString() {
    return toString(__outputDelimiters, true);
  }
  public String toString(DelimiterSet delimiters) {
    return toString(delimiters, true);
  }
  public String toString(boolean useRecordDelim) {
    return toString(__outputDelimiters, useRecordDelim);
  }
  public String toString(DelimiterSet delimiters, boolean useRecordDelim) {
    StringBuilder __sb = new StringBuilder();
    char fieldDelim = delimiters.getFieldsTerminatedBy();
    __sb.append(FieldFormatter.escapeAndEnclose(r_regionkey==null?"null":"" + r_regionkey, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(r_name==null?"null":r_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(r_comment==null?"null":r_comment, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  private final DelimiterSet __inputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  private RecordParser __parser;
  public void parse(Text __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharSequence __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(byte [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(char [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(ByteBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  private void __loadFromFields(List<String> fields) {
    Iterator<String> __it = fields.listIterator();
    String __cur_str;
    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.r_regionkey = null; } else {
      this.r_regionkey = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.r_name = null; } else {
      this.r_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.r_comment = null; } else {
      this.r_comment = __cur_str;
    }

  }

  public Object clone() throws CloneNotSupportedException {
    region o = (region) super.clone();
    return o;
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new TreeMap<String, Object>();
    __sqoop$field_map.put("r_regionkey", this.r_regionkey);
    __sqoop$field_map.put("r_name", this.r_name);
    __sqoop$field_map.put("r_comment", this.r_comment);
    return __sqoop$field_map;
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if ("r_regionkey".equals(__fieldName)) {
      this.r_regionkey = (Integer) __fieldVal;
    }
    else    if ("r_name".equals(__fieldName)) {
      this.r_name = (String) __fieldVal;
    }
    else    if ("r_comment".equals(__fieldName)) {
      this.r_comment = (String) __fieldVal;
    }
    else {
      throw new RuntimeException("No such field: " + __fieldName);
    }
  }
}
