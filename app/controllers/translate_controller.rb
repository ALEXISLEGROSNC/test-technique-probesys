require 'csv'

class TranslateController < ApplicationController
  def translate
    #arguments
    country_code = params[:countryCode]
    strings = params[:strings]

    # validation des arguments
    if country_code.blank? || strings.blank?
      render json: { error: 'Besoin de countryCode et strings' }, status: :bad_request
      return
    end

    #retour des traductions
    render json: load_translations(country_code, strings)
  end

  private

  def load_translations(country_code, strings)
    file_path = Rails.root.join('db', 'i18n', "#{country_code}.csv")
    unless File.exist?(file_path)
      raise "Translation file for #{country_code} does not exist."
    end

    translations = {}
    CSV.foreach(file_path, headers: true) do |row|
      key = row['key']
      value = row['value']
      translations[key] = value if strings.include?(key) # on n'inclut que les strings demandées
    end
    translations
  end
end
