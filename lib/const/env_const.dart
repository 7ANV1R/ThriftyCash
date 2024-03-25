class EnvConst {
  static const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const supabaseAPIUrl = '${const String.fromEnvironment('SUPABASE_URL')}/rest/v1';
  static const supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');
  static const supabaseAPIKey = String.fromEnvironment('API_KEY');

  static const apiHeader = {'apikey': supabaseAPIKey, 'Authorization': 'Bearer $supabaseAPIKey'};
}
