# Path: src/infra/db/entities/employees.py

from sqlalchemy import Column, String, Integer, Boolean
from src.infra.db.settings.base import Base

class Users(Base):
    __tablename__ ='users'

    user_id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    username = Column(String, nullable=False)
    password = Column(String, nullable=False)
    is_manager = Column(Boolean, default=False)
    leader_id = Column(Integer, nullable=True)
    created_at = Column(String, nullable=False)
    updated_at = Column(String, nullable=False)

    def __repr__(self):
        return f"User [user_id={self.user_id}, username={self.username}]"
