var
  ssrExample* = """import happyx

serve "127.0.0.1", 5000:
  get "/":
    return "Hello, world!"
"""
  spaExample* = """import happyx

appRoutes "app":
  "/":
    "Hello, world!"
"""
  fileResponseExample* = """import happyx

server "127.0.0.1", 5000:
  "/":
    return FileResponse("image.png")
"""
  pathParamsSsrExample* = """import happyx

server "127.0.0.1", 5000:
  "/user{id:int}":
    return fmt"Hello! user {id}"
"""
  pathParamsSpaExample* = """import happyx

appRoutes "app":
  "/user{id:int}":
    "Hello! user {id}"
"""

  nimSsrHelloWorldExample* = """import happyx

# Serve app at http://localhost:5000
serve "127.0.0.1", 5000:
  # GET Method
  get "/":
    # Respond plaintext
    return "Hello, world"
"""

  nimSpaHelloWorldExample* = """import happyx

# Serve app at http://localhost:5000
appRoutes "app":
  # at example.com/#/
  "/":
    # plaintext
    "Hello, world"
"""

  pythonHelloWorldExample* = """from happyx import new_server

# Create application
app = new_server('127.0.0.1', 5000)


# GET method
@app.get('/')
def hello_world():
    # Respond plaintext
    return 'Hello, world!'


# start our app
app.start()
"""

  jsHelloWorldExample* = """import { Server } from "happyx";

// Create application
const app = new Server('127.0.0.1', 5000);


// GET method
app.get("/", (req) => {
  // Respond plaintext
  return "Hello, world!";
});


// start our app
app.start();
"""

  tsHelloWorldExample* = """import { Server, Request } from "happyx";

// Create application
const app = new Server('127.0.0.1', 5000);


// GET method
app.get("/", (req: Request) => {
  // Respond plaintext
  return "Hello, world!";
});


// start our app
app.start();
"""

  htmlHelloWorldExample* = """<!DOCTYPE html>
<html>
  <head>
    <title>Hello World App</title>
  </head>
  <body>
    <div id="app">
      <!-- Here will be your application -->
    </div>
    <!-- Nim script after compilation -->
    <script src="example.js"></script>
  </body>
</html>
"""

  nimProjectSsr* = """project/
├─ src/
│  ├─ templates/
│  │  ├─ index.html
│  ├─ public/
│  │  ├─ icon.svg
│  ├─ main.nim
├─ README.md
├─ .gitignore
├─ happyx.cfg
├─ project.nimble
"""

  nimProjectSpa* = """project/
├─ src/
│  ├─ public/
│  │  ├─ icon.svg
│  ├─ components/
│  │  ├─ hello_world.nim
│  ├─ main.nim
│  ├─ index.html
├─ README.md
├─ .gitignore
├─ happyx.cfg
├─ project.nimble
"""

  pythonProject* = """project/
├─ main.py
├─ README.md
├─ .gitignore
"""
  javaScriptProject* = """project/
├─ node_modules/
├─ src/
│  ├─ index.js
├─ .gitignore
├─ package.json
├─ README.md
"""
  typeScriptProject* = """project/
├─ node_modules/
├─ src/
│  ├─ index.ts
├─ .gitignore
├─ package.json
├─ tsconfig.json
├─ README.md
"""
  nimSsrCalc* = """serve "127.0.0.1", 5000:
  get "/calc/{left:float}/{op}/{right:float}":
    case op
    of "+": return fmt"{left + right}"
    of "-": return fmt"{left - right}"
    of "/": return fmt"{left / right}"
    of "*": return fmt"{left * right}"
    else:
      statusCode = 404
      return "failure"
"""
  nimSpaCalc* = """appRoutes "app":
  "/calc/{left:float}/{op}/{right:float}":
    tDiv(class = "flex text-4xl justify-center items-center w-screen h-screen text-orange-200 bg-neutral-900"):
      if op == "+":
        {left + right}
      elif op == "-":
        {left - right}
      elif op == "/":
        {left / right}
      elif op == "*":
        {left * right}
      else:
        "failure"
"""
  pythonSsrCalc* = """@app.get('/calc/{left}/{op}/{right}')
def calculate(left: float, right: float, op: str):
    if op == "+":
        return left + right
    elif op == "-":
        return left - right
    elif op == "/":
        return left / right
    elif op == "*":
        return left * right
    else:
        return Response("failure", status_code=404)
"""
  javaScriptSsrCalc* = """app.get("/calc/{left}/{op}/{right}", (req) => {
  if req.params.op == "+":
    return req.params.left + req.params.right;
  elif req.params.op == "-":
    return req.params.left - req.params.right;
  elif req.params.op == "/":
    return req.params.left / req.params.right;
  elif req.params.op == "*":
    return req.params.left * req.params.right;
  req.answer("failure", code=404);
});
"""
  typeScriptSsrCalc* = """app.get("/calc/{left}/{op}/{right}", (req: Request) => {
  if req.params.op == "+":
    return req.params.left + req.params.right;
  elif req.params.op == "-":
    return req.params.left - req.params.right;
  elif req.params.op == "/":
    return req.params.left / req.params.right;
  elif req.params.op == "*":
    return req.params.left * req.params.right;
  req.answer("failure", code=404);
});
"""
  nimPathParamsSsr* = """serve "127.0.0.1", 5000:
  get "/user/id{userId:int}":
    ## here we can use userId as immutable variable
    echo userId
    return $userId
"""
  pythonPathParamsSsr* = """app = new_server()

@app.get('/user/id{user_id}')
def handle(user_id: int):
    # Here we can use user_id
    print(user_id)
    return {'response': user_id}
"""
  jsPathParamsSsr* = """const app = new Server();

app.get("/user/id{userId}", (req) => {
  console.log(req.params.userId);
  return {'response': userId};
});
"""
  tsPathParamsSsr* = """const app = new Server();

app.get("/user/id{userId}", (req: Request) => {
  console.log(req.params.userId);
  return {'response': userId};
});
"""
  nimPathParamsSpa* = """appRoutes "app":
  "/user/id{userId:int}":
    ## here we can use userId as immutable variable
    tDiv:
      {userId}
"""
  nimCustomPathParamTypeSsr* = """import happyx

type MyType* = object
  first, second, third: string

proc parseMyType*(data: string): MyType =
  MyType(
    first: data[0], second: data[1], third: data[2]
  )

registerRouteParamType(
  "my_type",  # unique type identifier
  "\d\w\d",  # type pattern
  parseMyType  # proc/func that takes one string argument and returns any data
)

serve "127.0.0.1", 5000:
  get "/{i:my_type}":
    echo i.first
    echo i.second
    echo i.third
"""
  nimCustomPathParamTypeSpa* = """import happyx

type MyType* = object
  first, second, third: string

proc parseMyType*(data: string): MyType =
  MyType(
    first: data[0], second: data[1], third: data[2]
  )

registerRouteParamType(
  "my_type",  # unique type identifier
  "\d\w\d",  # type pattern
  parseMyType  # proc/func that takes one string argument and returns any data
)

appRoutes "app":
  "/{i:my_type}":
    echo i.first
    echo i.second
    echo i.third
"""
  pythonCustomRouteParamType* = """from happyx import new_server, register_route_param_type


app = new_server()


# Here is unique identifier, regex pattern and function/class object
@register_route_param_type("my_unique_id", r"\d+")
class MyUniqueIdentifier:
    def __init__(self, data: str):
        self.identifier = int(data)


@app.get("/registered/{data}")
def handle(data: MyUniqueIdentifier):
    print(data.identifier)
    return {'response': data.identifier}


app.start()
"""
  jsCustomRouteParamType* = """import { newPathParamType, Server } from "happyx";

const app = new Server();

// Here is unique identifier, RegExp pattern and function object
newPathParamType("my_unique_id", /\d+/, (data) => {
  return Number(data);
});

app.get("/registered/{data:my_unique_id}", (req) => {
  return req.params.data;
});

app.start()
"""
  tsCustomRouteParamType* = """import { newPathParamType, Server, Request } from "happyx";

const app = new Server();

// Here is unique identifier, RegExp pattern and function object
newPathParamType("my_unique_id", /\d+/, (data: string) => {
  return Number(data);
});

app.get("/registered/{data:my_unique_id}", (req: Request) => {
  return req.params.data;
});

app.start()
"""
  nimAssignRouteParamsSsr* = """import happyx

# declare path params
pathParams:
  paramName:  # assign param name
    type int  # param type
    optional  # param is optional
    mutable  # param is mutable variable
    default = 100  # default param value is 100


serve "127.0.0.1", 5000:
  # Use paramName
  get "/<paramName>":
    echo paramName
"""
  nimAssignRouteParamsSpa* = """import happyx

# declare path params
pathParams:
  paramName:  # assign param name
    type int  # param type
    optional  # param is optional
    mutable  # param is mutable variable
    default = 100  # default param value is 100


appRoutes "app":
  # Use paramName
  "/<paramName>":
    echo paramName
"""
  nimSpaRouting* = """import happyx


appRoutes "app":
  "/":
    "Welcome to home!"
    tButton:
      "go to '/bye'"
      @click:
        # When button clicked you'll redirect to /bye route
        route("/bye")
  "/bye":
    "Goodbye!"
"""
