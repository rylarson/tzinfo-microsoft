#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'erb'

GENERATED_DEFINITION_DIRECTORY = File.expand_path('../../lib/tzinfo/microsoft/definitions', __FILE__)

def create_time_zone_map
    windows_time_zone_map = Nokogiri::XML(open('http://unicode.org/repos/cldr/trunk/common/supplemental/windowsZones.xml'))
    map_zones = windows_time_zone_map.xpath('//mapZone')
    zone_map = {}

    map_zones.each do |map_zone|
        key = map_zone.attr('other')
        zone_map[key] = map_zone.attr('type') unless zone_map.has_key?(key)
    end
    zone_map
end

def definition_file(windows_zone)
    File.join(GENERATED_DEFINITION_DIRECTORY, "#{windows_zone.gsub(/\s+|\./, '').gsub(/\(|\)/, '_').gsub(/\+/, '__p__').gsub(/-/, '__m__')}.rb")
end

zone_map = create_time_zone_map
template_file = File.read('definition_template.erb')

zone_map.each do |windows_zone, iana_zone|
    generated_file = definition_file(zone_map.first[0])
    File.open(generated_file, 'w') do |file|
        file.write ERB.new(template_file).result
    end
end
