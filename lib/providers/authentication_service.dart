import 'package:supabase/supabase.dart';

class SupabaseKeys {
  static const String YOUR_SUPABASE_URL = "";
  static const String YOUR_SUPABASE_ANON_KEY = "";
  static SupabaseClient supabaseClient =
      SupabaseClient(YOUR_SUPABASE_URL, YOUR_SUPABASE_ANON_KEY);
}

class AuthenticationService {}
