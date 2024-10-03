import ast
string = "data=[{'id': 1, 'created_at': '2023-02-08T19:22:12.669496+00:00', 'email_id': 'lol@gmail.com', 'username': 'lol', 'password': 'lolcool', 'session_active': True}, {'id': 2, 'created_at': '2023-02-10T10:47:29.930185+00:00', 'email_id': 'lol1@gmail.com', 'username': 'lol1', 'password': 'lolcool1', 'session_active': False}] count=None"
stringlol = ""
placestart = string.find("[")
placeend = string.find("]")

for i in range(placestart,placeend+1):
    stringlol += string[i]

stringlist = ast.literal_eval(stringlol)

dicfinal ={}
i=0
for dic in stringlist:
        dicfinal['Query'+str(i)] = dic
        i+=1
lol = []
for j in dicfinal.values():
    if j["username"] == "lol" and j["password"] == "lolcool":
            lol.append(j)


print(lol)
