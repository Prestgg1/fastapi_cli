from fastapi import APIRouter
from models.user import User

router = APIRouter(prefix="/user", tags=["User"])

# Fake DB (temporary)
db = []

@router.get("/")
def list_users():
    return db

@router.get("/{item_id}")
def show_user(item_id: int):
    for item in db:
        if item["id"] == item_id:
            return item
    return {"error": "User tapılmadı"}

@router.post("/")
def create_user(item: User):
    db.append(item.dict())
    return {"message": "User yaradıldı", "data": item}

@router.put("/{item_id}")
def update_user(item_id: int, updated: User):
    for index, item in enumerate(db):
        if item["id"] == item_id:
            db[index] = updated.dict()
            return {"message": "User yeniləndi"}
    return {"error": "User tapılmadı"}
