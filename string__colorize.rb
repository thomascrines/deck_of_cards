class String
  # colorization
  def colorize(text, background, bold=false)
    bold_modifier = ''
    bold_modifier = '1;' if bold

    return "\e[#{bold_modifier}#{text};#{background}m#{self}\e[0m"
  end
end
