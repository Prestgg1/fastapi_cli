from models.user import User

def seed_user():
    data = [
        User(id=1, name="Nümunə 1", created_at="2025-01-01", updated_at="2025-01-01"),
        User(id=2, name="Nümunə 2", created_at="2025-01-01", updated_at="2025-01-01"),
    ]
    return data
