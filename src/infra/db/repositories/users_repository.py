# pylint: disable=too-many-arguments

from src.infra.db.settings.connection import DBConnectionHandler
from src.infra.db.entities.users import Users as UserEntity


class UsersRepository:

    @classmethod
    def create_user(cls, username: str, password: str, is_manager: bool, leader_id: int, created_at: str, updated_at: str) -> None:
        with DBConnectionHandler() as db_connection:
            try:
                new_registry = UserEntity(
                    username=username,
                    password=password,
                    is_manager=is_manager,
                    leader_id=leader_id,
                    created_at=created_at,
                    updated_at=updated_at
                )
                db_connection.session.add(new_registry)
                db_connection.session.commit()
            except Exception as exception:
                db_connection.session.rollback()
                raise exception

    @classmethod
    def select_user_by_name(cls, username: str) -> UserEntity:
        with DBConnectionHandler() as db_connection:
            try:
                user = db_connection.session.query(UserEntity).filter_by(username=username).first()
                return user
            except Exception as exception:
                db_connection.session.rollback()
                raise exception

    @classmethod
    def select_user_by_id(cls, user_id: int) -> UserEntity:
        with DBConnectionHandler() as db_connection:
            try:
                user = db_connection.session.query(UserEntity).filter_by(user_id=user_id).first()
                return user
            except Exception as exception:
                db_connection.session.rollback()
                raise exception
