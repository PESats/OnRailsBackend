require 'test_helper'

class ComentarisControllerTest < ActionDispatch::IntegrationTest

    test "create new comentari" do
        user = correct_user
        user.login
        user.reload
        anun = correct_anunci

        post anuncis_path, params: {
            anunci: {
                title: anun.title,
                description: anun.description,
                latitude: anun.latitude,
                longitude: anun.longitude,
                reward: anun.reward
            },
            user_id: user.id, active_token: user.active_token
        }
        assert_equal "200", response.code

        anun = user.reload.anuncis.last


        post comentaris_path, params: {
            comentari: {
                text: "Hello World",
                user_id: user.id,
                anunci_id: anun.id
            }
        }
        comm = user.reload.comentaris.last

        assert_equal "Hello World", comm.text
    end

    test "Comments shall be editable" do
      user = correct_user
      user.login
      user.reload
      anun = correct_anunci
      anun.save
      anun = user.reload.anuncis.last

      user2 = correct_user2
      user2.login
      user2.reload

      comm = correct_commentf2t1
      comm.save
      newtext = "The text was changed";

      put comentari_path(comm.id), params: {
        comentari: {
          text: newtext
        },
        user_id: user2.id,
        active_token: user2.active_token
      }
      p(response.body)
      assert_equal "200", response.code

      comm = user2.reload.comentaris.last

      assert_equal newtext, comm.text
    end

    test "Comments shall not be edited by anyone but its creator" do
      user = correct_user
      user.login
      user.reload
      anun = correct_anunci
      anun.save
      anun = user.reload.anuncis.last

      user2 = correct_user2
      user2.login
      user2.reload

      comm = correct_commentf2t1
      comm.save
      newtext = "The text was changed";

      put comentari_path(comm.id), params: {
        comentari: {
          text: newtext
        },
        user_id: user.id,
        active_token: user.active_token
      }
      #p(response.body)
      assert_equal "400", response.code
    end

end
