from fastapi import FastAPI

app = FastAPI(
    title="Base API",
    description="You can use this API.",
    version="1.0.0",
)


@app.get("/")
async def root():
    return {"message": "Hello World"}


@app.get("/hello/{name}")
async def say_hello(name: str):
    return {"message": f"Hello {name}"}
