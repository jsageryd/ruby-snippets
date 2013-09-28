#!/usr/bin/env ruby
# encoding: utf-8

require 'time'
require 'tzinfo'

def time_with_offset(time, zone)
  tz = TZInfo::Timezone.get(zone)
  tz_str = Time.at(tz.period_for_local(time).utc_total_offset).utc.strftime('+%H%M')
  time.strftime('%Y-%m-%d %H:%M:%S') + ' ' + tz_str
end

zones = ['Europe/Stockholm', 'Asia/Tokyo']
times = ['2013-02-01', '2013-08-01']
times.each do |time|
  zones.each do |zone|
    puts "#{zone.rjust(16)}: #{time_with_offset(Time.parse(time), zone)}"
  end
end
