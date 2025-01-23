from fastapi import APIRouter

from app.handlers.BaseHandler import BaseHandler

router = APIRouter()


@router.get("/")
def base():
    return BaseHandler.message()
