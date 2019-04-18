from flask import Flask, render_template,request
app = Flask(__name__)

users = [

    {
    'user' : 'nhung',
    'pass': '12345'
      },
 
]

 
@app.route('/',methods = ['POST'] )
def login():
    username = request.form.get('username')
    password = request.form.get('password')
    ktra = 0
    for v in users :
      if username == v['user']  and password == v['pass'] :
        ktra = 1
        

    if ktra==1 :
        return render_template('succ.html')
    else :
        return render_template('fail.html')
    
@app.route('/', methods = ['Get'])
def get():
   return render_template('poen.html', data = users)

if __name__ == '__main__':
  app.run(host = '127.0.0.1', port=8000, debug=True)





