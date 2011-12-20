require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  test "should accept a video with all attributes" do
    assert videos(:the_shining).save
  end

  test "should accept a video without imdb_id, but with tmdb_id" do
    assert videos(:without_imdb_id).save
  end

  test "should accept a video without tmdb_id, but with imdb_id" do
    assert videos(:without_tmdb_id).save
  end

  test "should not accept a video without any id of movies site" do
    assert not(Video.new.save)
  end

  test "should have title method" do
    assert (videos(:the_shining).respond_to? 'title')
  end

  test "should have title_original method" do
    assert (videos(:the_shining).respond_to? 'title_original')
  end

  test "should have year method" do
    assert (videos(:the_shining).respond_to? 'year')
  end

  test "should have plot method" do
    assert (videos(:the_shining).respond_to? 'plot')
  end

  test "title method should return expected information" do
    if videos(:the_shining).respond_to? 'title'
      assert_equal 'O Iluminado', videos(:the_shining).title
    else
      flunk
    end
  end

  test "title_original method should return expected information" do
    if videos(:the_shining).respond_to? 'title_original'
      assert_equal 'The Shining', videos(:the_shining).title_original
    else
      flunk
    end
  end

  test "year method should return expected information" do
    if videos(:the_shining).respond_to? 'year'
      assert_equal 1980, videos(:the_shining).year
    else
      flunk
    end
  end
end
