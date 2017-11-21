require 'test_helper'

class ComentarisControllerTest < ActionDispatch::IntegrationTest

    test "create new comentari" do
        user = correct_user
        user.login

        anun = correct_anunci

        post anunci_comentaris_path(anun.id), params: {
            comentari: {
                text: "We are not them",
                reward: 20
            },
            user_id: user.id,
            active_token: user.active_token
        }
        assert_equal "201", response.code
        # comm = user.reload.comentaris.last

        # assert_equal "Hello World", comm.text
    end

    test "create new comentari with no reward" do
        user = correct_user
        user.login

        anun = correct_anunci

        post anunci_comentaris_path(anun.id), params: {
            comentari: {
                text: "Comment with no reward"
            },
            user_id: user.id,
            active_token: user.active_token
        }
        assert_equal "201", response.code
    end

    test "Comments shall be editable" do
      user = correct_user
      user.login

      anun = correct_anunci


      user2 = correct_user2
      user2.login


      comm = correct_commentf2t1

      newtext = "The text was changed";

      put anunci_comentari_path(anun.id,comm.id), params: {
        comentari: {
          text: newtext
        },
        user_id: user2.id,
        active_token: user2.active_token
      }
      #p(response.body)
      assert_equal "200", response.code

      comm = user2.reload.comentaris.last

      assert_equal newtext, comm.text
    end

    test "Comments shall not be edited by anyone but its creator" do
      user = correct_user
      user.login

      anun = correct_anunci

      user2 = correct_user2
      user2.login

      comm = correct_commentf2t1

      newtext = "The text was changed";

      put anunci_comentari_path(anun.id,comm.id), params: {
        comentari: {
          text: newtext
        },
        user_id: user.id,
        active_token: user.active_token
      }
      # p(response.body)
      assert_equal "401", response.code
    end

    test "Comments shall be deletable" do
      user = correct_user
      user.login

      # p(user.comentaris)

      # p(user.comentaris.count())
      anun = correct_anunci


      # p(anun.comentaris)
      # num_com = anun.comentaris.count()
      # p(num_com)
      comm = correct_comment

      delete anunci_comentari_path(anun.id,comm.id), params: {
        user_id: user.id,
        active_token: user.active_token
      }
      assert_equal "204", response.code
      assert_equal 0, Comentari.where(id: comm.id).count, "Comment wasn't deleted "
    end

    test "Comments can only be deleted by its owner" do
      user = correct_user
      user.login

      anun = correct_anunci


      user2 = correct_user2
      user2.login

      comm = correct_commentf2t1

      delete anunci_comentari_path(anun.id,comm.id), params: {
        user_id: user.id,
        active_token: user.active_token
      }
      assert_equal '401', response.code
    end

    test "Index request shall be made for a certain anunci_id" do

      user = correct_user
      user.login

      anun = correct_anunci
      # anun.save

      get anunci_comentaris_path(anun.id), params: {
        user_id: user.id,
        active_token: user.active_token
      }
      # p(response.body)
      assert_equal '200', response.code
    end
    
    test "Show comentar" do
      comment = correct_comment
      user = correct_user
      user.login
      
      get comentari_path(comment.id), params: {
        user_id: user.id,
        active_token: user.active_token
      }
      
      assert_equal '200', response.code
    end
  end