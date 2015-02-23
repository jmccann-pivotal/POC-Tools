// ORM class for part
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

public class part extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  protected ResultSet __cur_result_set;
  private Long p_partkey;
  public Long get_p_partkey() {
    return p_partkey;
  }
  public void set_p_partkey(Long p_partkey) {
    this.p_partkey = p_partkey;
  }
  public part with_p_partkey(Long p_partkey) {
    this.p_partkey = p_partkey;
    return this;
  }
  private String p_name;
  public String get_p_name() {
    return p_name;
  }
  public void set_p_name(String p_name) {
    this.p_name = p_name;
  }
  public part with_p_name(String p_name) {
    this.p_name = p_name;
    return this;
  }
  private String p_mfgr;
  public String get_p_mfgr() {
    return p_mfgr;
  }
  public void set_p_mfgr(String p_mfgr) {
    this.p_mfgr = p_mfgr;
  }
  public part with_p_mfgr(String p_mfgr) {
    this.p_mfgr = p_mfgr;
    return this;
  }
  private String p_brand;
  public String get_p_brand() {
    return p_brand;
  }
  public void set_p_brand(String p_brand) {
    this.p_brand = p_brand;
  }
  public part with_p_brand(String p_brand) {
    this.p_brand = p_brand;
    return this;
  }
  private String p_type;
  public String get_p_type() {
    return p_type;
  }
  public void set_p_type(String p_type) {
    this.p_type = p_type;
  }
  public part with_p_type(String p_type) {
    this.p_type = p_type;
    return this;
  }
  private Integer p_size;
  public Integer get_p_size() {
    return p_size;
  }
  public void set_p_size(Integer p_size) {
    this.p_size = p_size;
  }
  public part with_p_size(Integer p_size) {
    this.p_size = p_size;
    return this;
  }
  private String p_container;
  public String get_p_container() {
    return p_container;
  }
  public void set_p_container(String p_container) {
    this.p_container = p_container;
  }
  public part with_p_container(String p_container) {
    this.p_container = p_container;
    return this;
  }
  private java.math.BigDecimal p_retailprice;
  public java.math.BigDecimal get_p_retailprice() {
    return p_retailprice;
  }
  public void set_p_retailprice(java.math.BigDecimal p_retailprice) {
    this.p_retailprice = p_retailprice;
  }
  public part with_p_retailprice(java.math.BigDecimal p_retailprice) {
    this.p_retailprice = p_retailprice;
    return this;
  }
  private String p_comment;
  public String get_p_comment() {
    return p_comment;
  }
  public void set_p_comment(String p_comment) {
    this.p_comment = p_comment;
  }
  public part with_p_comment(String p_comment) {
    this.p_comment = p_comment;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof part)) {
      return false;
    }
    part that = (part) o;
    boolean equal = true;
    equal = equal && (this.p_partkey == null ? that.p_partkey == null : this.p_partkey.equals(that.p_partkey));
    equal = equal && (this.p_name == null ? that.p_name == null : this.p_name.equals(that.p_name));
    equal = equal && (this.p_mfgr == null ? that.p_mfgr == null : this.p_mfgr.equals(that.p_mfgr));
    equal = equal && (this.p_brand == null ? that.p_brand == null : this.p_brand.equals(that.p_brand));
    equal = equal && (this.p_type == null ? that.p_type == null : this.p_type.equals(that.p_type));
    equal = equal && (this.p_size == null ? that.p_size == null : this.p_size.equals(that.p_size));
    equal = equal && (this.p_container == null ? that.p_container == null : this.p_container.equals(that.p_container));
    equal = equal && (this.p_retailprice == null ? that.p_retailprice == null : this.p_retailprice.equals(that.p_retailprice));
    equal = equal && (this.p_comment == null ? that.p_comment == null : this.p_comment.equals(that.p_comment));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.p_partkey = JdbcWritableBridge.readLong(1, __dbResults);
    this.p_name = JdbcWritableBridge.readString(2, __dbResults);
    this.p_mfgr = JdbcWritableBridge.readString(3, __dbResults);
    this.p_brand = JdbcWritableBridge.readString(4, __dbResults);
    this.p_type = JdbcWritableBridge.readString(5, __dbResults);
    this.p_size = JdbcWritableBridge.readInteger(6, __dbResults);
    this.p_container = JdbcWritableBridge.readString(7, __dbResults);
    this.p_retailprice = JdbcWritableBridge.readBigDecimal(8, __dbResults);
    this.p_comment = JdbcWritableBridge.readString(9, __dbResults);
  }
  public void loadLargeObjects(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void write(PreparedStatement __dbStmt) throws SQLException {
    write(__dbStmt, 0);
  }

  public int write(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeLong(p_partkey, 1 + __off, -5, __dbStmt);
    JdbcWritableBridge.writeString(p_name, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(p_mfgr, 3 + __off, 1, __dbStmt);
    JdbcWritableBridge.writeString(p_brand, 4 + __off, 1, __dbStmt);
    JdbcWritableBridge.writeString(p_type, 5 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeInteger(p_size, 6 + __off, 4, __dbStmt);
    JdbcWritableBridge.writeString(p_container, 7 + __off, 1, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(p_retailprice, 8 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeString(p_comment, 9 + __off, 12, __dbStmt);
    return 9;
  }
  public void readFields(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.p_partkey = null;
    } else {
    this.p_partkey = Long.valueOf(__dataIn.readLong());
    }
    if (__dataIn.readBoolean()) { 
        this.p_name = null;
    } else {
    this.p_name = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.p_mfgr = null;
    } else {
    this.p_mfgr = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.p_brand = null;
    } else {
    this.p_brand = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.p_type = null;
    } else {
    this.p_type = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.p_size = null;
    } else {
    this.p_size = Integer.valueOf(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.p_container = null;
    } else {
    this.p_container = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.p_retailprice = null;
    } else {
    this.p_retailprice = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.p_comment = null;
    } else {
    this.p_comment = Text.readString(__dataIn);
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.p_partkey) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.p_partkey);
    }
    if (null == this.p_name) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, p_name);
    }
    if (null == this.p_mfgr) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, p_mfgr);
    }
    if (null == this.p_brand) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, p_brand);
    }
    if (null == this.p_type) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, p_type);
    }
    if (null == this.p_size) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeInt(this.p_size);
    }
    if (null == this.p_container) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, p_container);
    }
    if (null == this.p_retailprice) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.p_retailprice, __dataOut);
    }
    if (null == this.p_comment) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, p_comment);
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
    __sb.append(FieldFormatter.escapeAndEnclose(p_partkey==null?"null":"" + p_partkey, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(p_name==null?"null":p_name, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(p_mfgr==null?"null":p_mfgr, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(p_brand==null?"null":p_brand, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(p_type==null?"null":p_type, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(p_size==null?"null":"" + p_size, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(p_container==null?"null":p_container, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(p_retailprice==null?"null":"" + p_retailprice, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(p_comment==null?"null":p_comment, delimiters));
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
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.p_partkey = null; } else {
      this.p_partkey = Long.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.p_name = null; } else {
      this.p_name = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.p_mfgr = null; } else {
      this.p_mfgr = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.p_brand = null; } else {
      this.p_brand = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.p_type = null; } else {
      this.p_type = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.p_size = null; } else {
      this.p_size = Integer.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.p_container = null; } else {
      this.p_container = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.p_retailprice = null; } else {
      this.p_retailprice = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.p_comment = null; } else {
      this.p_comment = __cur_str;
    }

  }

  public Object clone() throws CloneNotSupportedException {
    part o = (part) super.clone();
    return o;
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new TreeMap<String, Object>();
    __sqoop$field_map.put("p_partkey", this.p_partkey);
    __sqoop$field_map.put("p_name", this.p_name);
    __sqoop$field_map.put("p_mfgr", this.p_mfgr);
    __sqoop$field_map.put("p_brand", this.p_brand);
    __sqoop$field_map.put("p_type", this.p_type);
    __sqoop$field_map.put("p_size", this.p_size);
    __sqoop$field_map.put("p_container", this.p_container);
    __sqoop$field_map.put("p_retailprice", this.p_retailprice);
    __sqoop$field_map.put("p_comment", this.p_comment);
    return __sqoop$field_map;
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if ("p_partkey".equals(__fieldName)) {
      this.p_partkey = (Long) __fieldVal;
    }
    else    if ("p_name".equals(__fieldName)) {
      this.p_name = (String) __fieldVal;
    }
    else    if ("p_mfgr".equals(__fieldName)) {
      this.p_mfgr = (String) __fieldVal;
    }
    else    if ("p_brand".equals(__fieldName)) {
      this.p_brand = (String) __fieldVal;
    }
    else    if ("p_type".equals(__fieldName)) {
      this.p_type = (String) __fieldVal;
    }
    else    if ("p_size".equals(__fieldName)) {
      this.p_size = (Integer) __fieldVal;
    }
    else    if ("p_container".equals(__fieldName)) {
      this.p_container = (String) __fieldVal;
    }
    else    if ("p_retailprice".equals(__fieldName)) {
      this.p_retailprice = (java.math.BigDecimal) __fieldVal;
    }
    else    if ("p_comment".equals(__fieldName)) {
      this.p_comment = (String) __fieldVal;
    }
    else {
      throw new RuntimeException("No such field: " + __fieldName);
    }
  }
}
