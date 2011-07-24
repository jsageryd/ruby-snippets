#!/usr/bin/env ruby
# encoding: utf-8

$VERBOSE = true

def containsJapanese?(text)
  # 3040-309F hiragana
  # 30A0-30FF katakana
  # 4E00-9FC2 kanji
  # FF61-FF9D half-width katakana
  # 31F0-31FF katakana phonetic extensions
  # 3000-303F CJK punctuation
  #
  # Source: http://www.unicode.org/charts/
  !!(text =~ /[\u3040-\u309F\u30A0-\u30FF\u4E00-\u9FC2\uFF61-\uFF9D\u31F0-\u31FF\u3000-\u303F]/)
end

def containsHiragana?(text)
  # 3040-309F hiragana
  #
  # Source: http://www.unicode.org/charts/
  !!(text =~ /[\u3040-\u309F]/)
end

def containsKatakana?(text)
  # 30A0-30FF katakana
  # FF61-FF9D half-width katakana
  # 31F0-31FF katakana phonetic extensions
  #
  # Source: http://www.unicode.org/charts/
  !!(text =~ /[\u30A0-\u30FF\uFF61-\uFF9D\u31F0-\u31FF]/)
end

def containsKanji?(text)
  # 4E00-9FC2 kanji
  #
  # Source: http://www.unicode.org/charts/
  !!(text =~ /[\u4E00-\u9FC2]/)
end

def containsCJKPunctuation?(text)
  # 3000-303F CJK punctuation
  #
  # Source: http://www.unicode.org/charts/
  !!(text =~ /[\u3000-\u303F]/)
end

def c(value)
  color = value ? 34 : 31
  text = value ? 'Ｏ' : 'Ｘ'
  "\e[##{color}m#{text}\e[0m"
end

puts "和あア漢点"
  ['Hello',
   'Ｈｅｌｌｏ',
   'こんにちは',
   'パクる',
   'ド真ん中',
   '「ブ暑い」',
   'ありがとう',
   'アリガトウ',
   '孑孒',
   '々。、',
   '有り難う',
   'ｱﾘｶﾞﾄｳ',
   '・'].each { |s| puts "#{c containsJapanese?(s)}#{c containsHiragana?(s)}#{c containsKatakana?(s)}#{c containsKanji?(s)}#{c containsCJKPunctuation?(s)}#{s}" }
