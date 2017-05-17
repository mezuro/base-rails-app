module ApplicationHelper
  def t_hint(attribute_key, class_key=nil, options={})
    class_key ||= controller_name.singularize
    t("activemodel.hints.#{class_key}.#{attribute_key}", options)
  end

  def t_action(action, model, options={})
    options[:default] = "helpers.submit.#{action}".to_sym
    count = options.delete(:count) || 1
    options[:model] = model.model_name.human(count: count)

    t("helpers.submit.#{model.model_name.i18n_key}.#{action}", options)
  end

  # method used to map locale route into flag name
  def map_locale(locale)
    mapped_locales = {
        "en": "us",
        "pt": "br"
    }

    mapped_locales[locale]
  end
end
