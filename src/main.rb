require "active_support"
require "active_support/core_ext"
require "./src/java_dependencies"

java_import com.badlogic.gdx.ApplicationAdapter
java_import com.badlogic.gdx.backends.lwjgl.LwjglApplication
java_import com.badlogic.gdx.backends.lwjgl.LwjglApplicationConfiguration
java_import com.badlogic.gdx.graphics.g2d.BitmapFont
java_import com.badlogic.gdx.graphics.g2d.SpriteBatch

class Application < ApplicationAdapter
  def create
    @batch = SpriteBatch.new
    @font = BitmapFont.new
  end

  def render
    @batch.begin
    @font.draw(@batch, "hello world", 100, 100)
    @batch.end
  end

  def dispose
    @font.dispose
    @batch.dispose
  end
end

LwjglApplication.new(Application.new, LwjglApplicationConfiguration.new)
