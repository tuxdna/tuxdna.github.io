#!/usr/bin/ruby

require 'sinatra'
require 'maruku'

load 'config.rb'

get '/' do
  files = Dir["#{NOTES_PATH}/**/*"].map do |k|
    k
  end.select do |f|
    File.ftype(f) == "file" # and f.end_with?(".txt")
  end
  
  paths = files.map do |f|
    rel_path = f.split(NOTES_PATH)[-1]
  end.sort

  paths.map { |p| "<a href='/show#{p}'>#{p}</a>" }.join("<br/>")
end

get '/show/*' do
  file_path = params[:splat]

  full_path = File.join(NOTES_PATH, file_path)
  if full_path.end_with?(".txt") then
    "<pre>" + File.read(full_path) + "</pre>"
  elsif full_path.end_with?(".md") then
    mku = Maruku.new(File.read(full_path))
    mku.to_html
  end
end

