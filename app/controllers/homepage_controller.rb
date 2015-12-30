class HomepageController < ApplicationController
  def index
    has_content_checks = cookies[:joke_content_has_checked] ? cookies[:joke_content_has_checked].split(",").map(&:to_i) : []

    if !has_content_checks.any?
      @content = Content.first
    else
      @content = Content.where('id NOT IN (?)',has_content_checks).first
    end
  end

  def content_check(content_id)
    puts "check cookies.........................................................."
    str = cookies[:joke_content_has_checked]? cookies[:joke_content_has_checked] : ""
    if str == ""
      str = content_id
    else
      str = str + "," + content_id
    end
    cookies[:joke_content_has_checked] = str
    Rails.logger.info cookies[:joke_content_has_checked]
  end

  def click
    puts "on create - homepage.........................................................."

    content_check(params[:id])
    has_content_checks = cookies[:joke_content_has_checked] ? cookies[:joke_content_has_checked].split(",").map(&:to_i) : []

    if !has_content_checks.any?
      @content = Content.first
    else
      @content = Content.where('id NOT IN (?)',has_content_checks).first
    end

    if @content
      Rails.logger.info @content.id
      render json: @content
    else
      render json: nil
    end

  end
end
