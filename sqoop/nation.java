// ORM class for nation
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

public class nation extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  protected ResultSet __cur_result_set;
  private Integer n_nationkey;
  public Integer get_n_nationkey() {
    return n_nationkey;
  }
  public void set_n_nationkey(Integer n_nationkey) {
    this.n_nationkey = n_nationkey;
  }
  public nation with_n_nationkey(Integer n_nationkey) {
    this.n_nationkey = n_nationkey;
    return this;
  }
  private String n_name;
  public String get_n_name() {
    return n_name;
  }
  public void set_n_name(String n_name) {
    this.n_name = n_name;
  }
  public nation with_n_name(String n_name) {
    this.n_name = n_name;
    return this;
  }
  private Integer n_regionkey;
  public Integer get_n_regionkey() {
    return n_regionkey;
  }
  public void set_n_regionkey(Integer n_regionkey) {
    this.n_regionkey = n_regionkey;
  }
  public nation with_n_regionkey(Integer n_regionkey) {
    this.n_regionkey = n_regionkey;
    return this;
  }
  private String n_comment;
  public String get_n_comment() {
    return n_comment;
  }
  public void set_n_comment(String n_comment) {
    this.n_comment = n_comment;
  }
  public nation with_n_comment(String n_comment) {
    this.n_comment = n_comment;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof nation)) {
      return false;
    }
    nation that = (nation) o;
    boolean equal = true;
    equal = equal && (this.n_nationkey == null ? that.n_nationkey == null : this.n_nationkey.equals(that.n_nationkey));
    equal = equal && (this.n_name == null ? that.n_name == null : this.n_name.equals(that.n_name));
    equal = equal && (this.n_regionkey == null ? that.n_regionkey == null : this.n_regionkey.equals(that.n_regionkey));
    equal = equal && (this.n_comment == null ? that.n_comment == null : this.n_comment.equals(that.n_comment));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.n_nationkey = JdbcWritableBridge.readInteger(1, __dbResults);
    this.n_name = JdbcWritableBridge.readString(2, __dbResults);
    this.n_regionkey = JdbcWritableBridge.readInteger(3, __dbResults);
    this.n_comment = JdbcWritableBridge.readString(4, __dbResults);
  }
  public void loadLargeObjects(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void write(PreparedStatement __dbStmt) throws SQLException {
    write(__dbStmt, 0);
  }

  public int write(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeInteger(n_nationkey, 1 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeString(n_name, 2 + __off, 1, __dbStmt);
    JdbcWritableBridge.writeInteger(n_regionkey, 3 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeString(n_comment, 4 + __off, 12, __dbStmt);
    return 4;
  }
  public void readFields(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.n_nationkey = null;
    } else {
    this.n_nationkey = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.n_name = null;
    } else {
    this.n_name = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.n_regionkey = null;
    } else {
    this.n_regionkey = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.n_comment = null;
    } else {
    this.n_comment = Text.readString(__dataIn);
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.n_nationkey) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.n_nationkey);
    }
    if (null == this.n_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, n_name);
    }
    if (null == this.n_regionkey) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.n_regionkey);
    }
    if (null == this.n_comment) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, n_comment);
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
    __sb.append(FieldFormatter.escapeAndEnclose(n_nationkey==null?"null":"" + n_nationkey, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(n_name==null?"null":n_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(n_regionkey==null?"null":"" + n_regionkey, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(n_comment==null?"null":n_comment, delimiters));
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
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.n_nationkey = null; } else {
      this.n_nationkey = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.n_name = null; } else {
      this.n_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.n_regionkey = null; } else {
      this.n_regionkey = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.n_comment = null; } else {
      this.n_comment = __cur_str;
    }

  }

  public Object clone() throws CloneNotSupportedException {
    nation o = (nation) super.clone();
    return o;
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new TreeMap<String, Object>();
    __sqoop$field_map.put("n_nationkey", this.n_nationkey);
    __sqoop$field_map.put("n_name", this.n_name);
    __sqoop$field_map.put("n_regionkey", this.n_regionkey);
    __sqoop$field_map.put("n_comment", this.n_comment);
    return __sqoop$field_map;
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if ("n_nationkey".equals(__fieldName)) {
      this.n_nationkey = (Integer) __fieldVal;
    }
    else    if ("n_name".equals(__fieldName)) {
      this.n_name = (String) __fieldVal;
    }
    else    if ("n_regionkey".equals(__fieldName)) {
      this.n_regionkey = (Integer) __fieldVal;
    }
    else    if ("n_comment".equals(__fieldName)) {
      this.n_comment = (String) __fieldVal;
    }
    else {
      throw new RuntimeException("No such field: " + __fieldName);
    }
  }
}