class SubtitlesController < ApplicationController
  def home
    @last_subtitles = Subtitle.order('created_at DESC').offset(0)
  end

end
