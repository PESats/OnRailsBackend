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
            user: { id: user.id, active_token: user.active_token }
        }
        assert_equal "200",              response.code
    
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

end
