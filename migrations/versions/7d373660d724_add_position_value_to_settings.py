"""Add position value to settings

Revision ID: 7d373660d724
Revises: b0f955e346fe
Create Date: 2024-03-10 23:07:42.502519

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '7d373660d724'
down_revision = 'b0f955e346fe'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('setting', schema=None) as batch_op:
        batch_op.add_column(sa.Column('position', sa.Integer(), nullable=True))

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('setting', schema=None) as batch_op:
        batch_op.drop_column('position')

    # ### end Alembic commands ###
