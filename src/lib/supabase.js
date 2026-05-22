import { createClient } from '@supabase/supabase-js'

const supabaseUrl = 'https://denhmucpuksiedfynokm.supabase.co'
const supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRlbmhtdWNwdWtzaWVkZnlub2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzIzNzkxNTYsImV4cCI6MjA4Nzk1NTE1Nn0.f25F82Z5nlds83KgI-W8fDsVQozvfALt_JUVT3MLkVU'

export const supabase = createClient(supabaseUrl, supabaseAnonKey)
