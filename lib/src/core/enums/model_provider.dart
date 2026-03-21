enum ModelProvider {
  openai,
  anthropic,
  google,
  xai,
  deepseek,
  alibaba,
  minimax,
  mistral,
  sarvam,
  ;

  String get label => switch (this) {
    openai => 'OpenAI',
    anthropic => 'Anthropic',
    google => 'Google',
    xai => 'xAI',
    deepseek => 'DeepSeek',
    alibaba => 'Alibaba',
    minimax => 'Minimax',
    mistral => 'Mistral',
    sarvam => 'Sarvam',
  };

  String get icon => switch (this) {
    openai => 'assets/icons/openai.svg',
    anthropic => 'assets/icons/anthropic.svg',
    google => 'assets/icons/google.svg',
    xai => 'assets/icons/xai.svg',
    deepseek => 'assets/icons/deepseek.svg',
    alibaba => 'assets/icons/alibaba.svg',
    minimax => 'assets/icons/minimax.svg',
    mistral => 'assets/icons/mistral.svg',
    sarvam => 'assets/icons/sarvam.svg',
  };
}
