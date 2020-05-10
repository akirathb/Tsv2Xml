#
# coding: utf-8
#

inputglob = '??章*_*.txt'

shuffle = "true"
numbering = "none"


per = ["%0%","%100%","%50%","%33.33333%","%25%","%20%"]
pern = ["0","100","50","33.33333","25","20"]

print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n")
print("<quiz>\n")

Dir.glob(inputglob).each do |fn|

  #  q = "*" +  fn.split(/\./)[0]
  q = fn.split(/\./)[0]
  File.open(fn) {|f|

    f.each_line {|line|

      l= line.chomp.split(/\t/) 
#     puts l

print("<!-- question: xxxx  -->\n")
print("  <question type=\"multichoice\">\n")
print("   <name>\n")
print("  <text>#{q}</text>\n")
print("    </name>\n")
print("<questiontext format=\"html\">\n")
print("<text><![CDATA[<p>#{l[1]}<br></p>]]></text>\n")
print("</questiontext>")
print("<questionfeeedback format=\"html\">\n")
print(" <text></text>\n")
print("</questionfeeedback>\n")
print("<defaultgrade>1</defaultgrade>\n")
print(" <penalty>0.3333333</penalty>\n")
print("    <hidden>0</hidden>\n")
print("    <idnumber></idnumber>\n")
print("    <single>false</single>\n")
print("    <shuffleanswers>#{shuffle}</shuffleanswers>\n")
print("    <answernumbering>#{numbering}</answernumbering>\n")
print("    <correctfeedback format=\"html\">\n")
print("      <text>あなたの答えは正解です。</text>\n")
print("    </correctfeedback>\n")
print("    <partiallycorrectfeedback format=\"html\">\n")
print("      <text>あなたの答えは部分的に正解です。</text>\n")
print("    </partiallycorrectfeedback>\n")
print("    <incorrectfeedback format=\"html\">\n")
print("      <text>あなたの答えは正しくありません。</text>\n")
print("    </incorrectfeedback>format=\"html\">\n")
print("   <shownumcorrect/>\n")

      l.shift
      l.shift
      
      c = l.map{|x|  x == "correct" ? 1 : 0 }.inject(:+)
      
      l.each_slice(2) do |s1,s2|
        
        p0 = "0"
        p0 = pern[c] if s2 == "correct"

print("   <answer fraction=\"#{p0}\" format=\"html\">\n")
print("      <text><![CDATA[<p>#{s1}<br></p>]]></text>\n")
print("      <feedback format=\"html\">\n")
print("        <text></text>\n")
print("      </feedback>\n")
print("    </answer>\n")        

#        print("\t~#{p0}<p>#{s1}<br></p>\n")
      end
print("  </question>\n")        

##      print("}\n\n")
    }
  }

end
print("</quiz>\n")
