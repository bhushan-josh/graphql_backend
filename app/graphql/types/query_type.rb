# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Users
    field :users, [Types::UserType], null: false
    def users
      User.all
    end

    field :user, Types::UserType, null: true do
      argument :id, ID, required: true
    end
    def user(id:)
      User.find_by(id: id)
    end

    # Posts
    field :posts, [Types::PostType], null: false
    def posts
      Post.all
    end

    field :post, Types::PostType, null: true do
      argument :id, ID, required: true
    end
    def post(id:)
      Post.find_by(id: id)
    end

    # Comments
    field :comments, [Types::CommentType], null: false
    def comments
      Comment.all
    end

    field :comment, Types::CommentType, null: true do
      argument :id, ID, required: true
    end
    def comment(id:)
      Comment.find_by(id: id)
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end
  end
end
