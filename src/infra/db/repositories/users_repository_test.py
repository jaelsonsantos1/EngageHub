import pytest
from sqlalchemy import text
from src.infra.db.settings.connection import DBConnectionHandler
from .users_repository import UsersRepository

psql = DBConnectionHandler()
connection = psql.get_engine().connect()


@pytest.mark.skip(reason='Sensitive test')
def test_users_repository_create_user():
    """Test create_user method"""

    mocked_username = 'jaelson.santos'
    mocked_password = 'teste@123'
    mocked_is_manager = False
    mocked_leader_id = None
    mocked_created_at = '2021-09-01 00:00:00'
    mocked_updated_at = '2021-09-01 00:00:00'

    user_repo = UsersRepository()
    user_repo.create_user(
        username=mocked_username,
        password=mocked_password,
        is_manager=mocked_is_manager,
        leader_id=mocked_leader_id,
        created_at=mocked_created_at,
        updated_at=mocked_updated_at
    )

    query = f'''
        SELECT *
            FROM users
        WHERE username = '{mocked_username}'
            AND password = '{mocked_password}'
            AND is_manager = {mocked_is_manager}
            AND leader_id IS NULL
            AND created_at = '{mocked_created_at}'
            AND updated_at = '{mocked_updated_at}'
    '''

    response = connection.execute(text(query))
    registry = response.first()

    assert registry.username == mocked_username
    assert registry.password == mocked_password
    assert registry.is_manager == mocked_is_manager
    assert registry.leader_id == mocked_leader_id
    assert str(registry.created_at) == mocked_created_at
    assert str(registry.updated_at) == mocked_updated_at

    connection.execute(text(f'DELETE FROM users WHERE user_id = {registry.user_id}'))
    connection.commit()


def test_users_repository_select_users():
    """Test test_users_repository_select_users method"""

    mocked_username = 'marcos.silva'
    mocked_password = 'teste@123'
    mocked_is_manager = False
    mocked_created_at = '2022-09-01 00:00:00'
    mocked_updated_at = '2022-09-01 00:00:00'

    query = f'''
        INSERT INTO users (username, password, is_manager, created_at, updated_at)
            VALUES ('{mocked_username}', '{mocked_password}', {mocked_is_manager}, '{mocked_created_at}', '{mocked_updated_at}')
    '''

    connection.execute(text(query))
    connection.commit()

    users_repository = UsersRepository()
    response = users_repository.select_user_by_name(username=mocked_username)

    assert response.username == mocked_username
    assert response.password == mocked_password
    assert response.is_manager == mocked_is_manager
    assert str(response.created_at) == mocked_created_at
    assert str(response.updated_at) == mocked_updated_at

    connection.execute(text(f'DELETE FROM users WHERE user_id = {response.user_id}'))
    connection.commit()


def test_users_repository_select_user_by_id():
    """Test test_users_repository_select_user_by_id method"""

    mocked_user_id = 1
    mocked_username = 'marcos.silva'
    mocked_password = 'teste@123'
    mocked_is_manager = False
    mocked_created_at = '2022-09-01 00:00:00'
    mocked_updated_at = '2022-09-01 00:00:00'

    query = f'''
        INSERT INTO users (user_id, username, password, is_manager, created_at, updated_at)
            VALUES ('{mocked_user_id}', '{mocked_username}', '{mocked_password}', {mocked_is_manager}, '{mocked_created_at}', '{mocked_updated_at}')
    '''

    connection.execute(text(query))
    connection.commit()

    users_repository = UsersRepository()
    response = users_repository.select_user_by_id(user_id=mocked_user_id)

    assert response.user_id == mocked_user_id
    assert response.username == mocked_username
    assert response.password == mocked_password
    assert response.is_manager == mocked_is_manager
    assert str(response.created_at) == mocked_created_at
    assert str(response.updated_at) == mocked_updated_at

    connection.execute(text(f'DELETE FROM users WHERE user_id = {response.user_id}'))
    connection.commit()
