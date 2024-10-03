import supabase

url = "https://zthdyyiqdqkuyzfnyfdf.supabase.co"
key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inp0aGR5eWlxZHFrdXl6Zm55ZmRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU4NjYzNzAsImV4cCI6MTk5MTQ0MjM3MH0.X1ONsH7sb6SAuUqeqhieP8LUkUCzconUiJZSHGuyS2c"
supabasestuff = supabase.create_client(url, key)



d = {}


datalol = supabasestuff.table("test1").select("*").execute()

print(type(datalol))

