from fastapi import FastAPI
from .routes import base
from dotenv import load_dotenv

load_dotenv()
application = FastAPI(
    title="Base API",
    description="You can use this API. 3",
    version="1.0.0",
)

application.include_router(base.router, prefix="/base", tags=["base"])


@application.get("/")
async def root():
    return {"message": "Hello World"}


@application.get("/hello/{name}")
async def say_hello(name: str):
    return {"message": f"Hello {name}"}
