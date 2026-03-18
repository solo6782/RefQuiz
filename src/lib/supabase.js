import { createClient } from '@supabase/supabase-js'

const supabaseUrl = 'https://fgsgknmizqgtokltmggf.supabase.co'
const supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZnc2drbm1penFndG9rbHRtZ2dmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzM3OTIxNzYsImV4cCI6MjA4OTM2ODE3Nn0.oSuWB9OQdyMVleHQA1HP8FmoRAjt2xcanl40kDkdki0'

export const supabase = createClient(supabaseUrl, supabaseAnonKey)
