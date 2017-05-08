# Install script for directory: /home/danilo/dev/cpp/QGIS/images/svg

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/svg/accommodation" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/images/svg/accommodation/accommodation_alpinehut.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/accommodation/accommodation_bed_and_breakfast.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/accommodation/accommodation_camping.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/accommodation/accommodation_caravan_park.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/accommodation/accommodation_hotel.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/accommodation/accommodation_hotel2.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/accommodation/accommodation_house.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/accommodation/accommodation_shelter.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/accommodation/accommodation_shelter2.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/accommodation/accommodation_youth_hostel.svg"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/svg/amenity" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/images/svg/amenity/amenity_bench.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/amenity/amenity_court.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/amenity/amenity_firestation.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/amenity/amenity_firestation2.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/amenity/amenity_firestation3.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/amenity/amenity_fountain.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/amenity/amenity_information.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/amenity/amenity_library.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/amenity/amenity_police.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/amenity/amenity_police2.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/amenity/amenity_post_box.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/amenity/amenity_post_office.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/amenity/amenity_prison.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/amenity/amenity_recycling.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/amenity/amenity_survey_point.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/amenity/amenity_telephone.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/amenity/amenity_toilets.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/amenity/amenity_toilets_disabled.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/amenity/amenity_toilets_men.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/amenity/amenity_toilets_women.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/amenity/amenity_waste_bin.svg"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/svg/arrows" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/images/svg/arrows/Arrow_01.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/arrows/Arrow_02.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/arrows/Arrow_03.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/arrows/Arrow_04.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/arrows/Arrow_05.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/arrows/Arrow_06.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/arrows/NorthArrow_01.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/arrows/NorthArrow_02.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/arrows/NorthArrow_03.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/arrows/NorthArrow_04.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/arrows/NorthArrow_05.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/arrows/NorthArrow_06.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/arrows/NorthArrow_07.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/arrows/NorthArrow_08.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/arrows/NorthArrow_09.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/arrows/NorthArrow_10.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/arrows/NorthArrow_11.svg"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/svg/backgrounds" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/images/svg/backgrounds/background_circle.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/backgrounds/background_forbidden.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/backgrounds/background_octogon.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/backgrounds/background_safety.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/backgrounds/background_security.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/backgrounds/background_security_02.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/backgrounds/background_square.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/backgrounds/background_square_rounded.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/backgrounds/background_tilted_square.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/backgrounds/background_tilted_square_rounded.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/backgrounds/background_triangle.svg"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/svg/components" TYPE FILE FILES "/home/danilo/dev/cpp/QGIS/images/svg/components/component_indoor.svg")
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/svg/crosses" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/images/svg/crosses/Cross1.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/crosses/Cross2.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/crosses/Cross4.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/crosses/Cross5.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/crosses/Cross6.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/crosses/Star1.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/crosses/Star2.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/crosses/Star3.svg"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/svg/emergency" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/images/svg/emergency/amenity=fire_station.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/emergency/amenity=hospital.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/emergency/amenity=police.svg"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/svg/entertainment" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/images/svg/entertainment/amenity=bar.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/entertainment/amenity=cafe.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/entertainment/amenity=cinema.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/entertainment/amenity=fast_food.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/entertainment/amenity=pub.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/entertainment/amenity=restaurant.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/entertainment/amenity=theatre.svg"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/svg/food" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/images/svg/food/food_bar.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/food/food_cafe.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/food/food_drinkingtap.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/food/food_fastfood.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/food/food_fastfood2.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/food/food_pub.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/food/food_restaurant.svg"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/svg/gpsicons" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/anchor.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/bank.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/boat.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/camera.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/car.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/city_building.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/city_large.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/city_medium.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/city_small.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/conveneince.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/couple.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/cross.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/deer.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/dollar.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/fish.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/flag.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/food.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/gas.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/golf.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/h.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/house.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/parachute.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/parking.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/phone.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/plane.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/plane_orange.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/point.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/question.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/shipwreck.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/skier.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/skull.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/swimmer.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/table.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/teepee.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/tree.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/walker.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/gpsicons/waypoint.svg"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/svg/health" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/images/svg/health/health_dentist.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/health/health_doctors.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/health/health_hospital.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/health/health_hospital_emergency.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/health/health_hospital_emergency2.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/health/health_opticians.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/health/health_pharmacy.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/health/health_veterinary.svg"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/svg/landmark" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/images/svg/landmark/amenity=place_of_worship.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/landmark/amenity=school.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/landmark/religion=buddhist.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/landmark/religion=christian.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/landmark/religion=hindu.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/landmark/religion=jewish.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/landmark/religion=muslim.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/landmark/religion=pastafarian.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/landmark/religion=sikh.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/landmark/tourism=museum.svg"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/svg/money" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/images/svg/money/money_atm.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/money/money_atm2.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/money/money_bank2.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/money/money_currency_exchange.svg"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/svg/religion" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/images/svg/religion/place_of_worship.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/religion/place_of_worship_bahai.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/religion/place_of_worship_bahai3.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/religion/place_of_worship_buddhist.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/religion/place_of_worship_buddhist3.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/religion/place_of_worship_christian.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/religion/place_of_worship_christian3.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/religion/place_of_worship_hindu.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/religion/place_of_worship_hindu3.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/religion/place_of_worship_islamic.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/religion/place_of_worship_islamic3.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/religion/place_of_worship_jain.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/religion/place_of_worship_jain3.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/religion/place_of_worship_jewish.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/religion/place_of_worship_jewish3.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/religion/place_of_worship_pastafarian.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/religion/place_of_worship_shinto.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/religion/place_of_worship_shinto3.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/religion/place_of_worship_sikh.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/religion/place_of_worship_sikh3.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/religion/place_of_worship_unknown3.svg"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/svg/services" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/images/svg/services/amenity=atm.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/services/amenity=pharmacy,dispensing=yes.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/services/amenity=pharmacy.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/services/amenity=post_box.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/services/amenity=recycling.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/services/amenity=telephone.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/services/shop=convenience.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/services/shop=supermarket.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/services/tourism=hotel.svg"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/svg/shopping" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_alcohol.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_bakery.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_bicycle.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_book.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_butcher.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_car.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_car_repair.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_clothes.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_confectionery.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_convenience.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_diy.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_estateagent.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_estateagent2.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_fish.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_garden_centre.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_gift.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_greengrocer.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_hairdresser.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_hifi.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_jewelry.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_laundrette.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_mobile_phone.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_motorcycle.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_music.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_pet.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_pet2.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_photo.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_supermarket.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_tackle.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/shopping/shopping_video_rental.svg"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/svg/sport" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/images/svg/sport/sport_archery.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/sport/sport_baseball.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/sport/sport_cricket.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/sport/sport_diving.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/sport/sport_golf.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/sport/sport_gym.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/sport/sport_gymnasium.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/sport/sport_gymnasium2.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/sport/sport_hillclimbing.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/sport/sport_horse_racing.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/sport/sport_iceskating.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/sport/sport_jetski.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/sport/sport_leisure_centre.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/sport/sport_motorracing.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/sport/sport_playground.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/sport/sport_sailing.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/sport/sport_skiing_crosscountry.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/sport/sport_skiing_downhill.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/sport/sport_snooker.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/sport/sport_soccer.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/sport/sport_swimming_indoor.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/sport/sport_swimming_outdoor.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/sport/sport_tennis.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/sport/sport_windsurfing.svg"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/svg/symbol" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/blue-marker.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/disability_accessibility.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/disability_accessibility2.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/disability_lowvision.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/education_nursery.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/education_school.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/education_university.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/fountain.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/landuse_coniferous.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/landuse_coniferous_and_deciduous.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/landuse_deciduous.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/landuse_grass.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/landuse_hills.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/landuse_quary.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/landuse_scrub.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/landuse_swamp.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/poi_boundary_administrative.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/poi_cave.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/poi_embassy.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/poi_embassy2.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/poi_military_bunker.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/poi_mine.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/poi_mine_abandoned.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/poi_peak.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/poi_place_city.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/poi_place_town.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/poi_place_village.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/poi_point_of_interest.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/poi_tower_communications.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/poi_tower_power.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/poi_tower_water.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/red-marker.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/symbol/water_tower.svg"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/svg/tourist" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/images/svg/tourist/tourist_archaeological.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/tourist/tourist_archaeological2.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/tourist/tourist_art_gallery.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/tourist/tourist_art_gallery2.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/tourist/tourist_battlefield.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/tourist/tourist_beach.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/tourist/tourist_casino.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/tourist/tourist_castle.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/tourist/tourist_cinema.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/tourist/tourist_cinema2.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/tourist/tourist_fountain.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/tourist/tourist_memorial.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/tourist/tourist_monument.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/tourist/tourist_museum.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/tourist/tourist_picnic.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/tourist/tourist_ruin.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/tourist/tourist_steam_train.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/tourist/tourist_theatre.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/tourist/tourist_view_point.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/tourist/tourist_waterwheel.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/tourist/tourist_windmill.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/tourist/tourist_wreck.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/tourist/tourist_zoo.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/tourist/tourisum_fountain.svg"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/svg/transport" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/amenity=airport.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/amenity=ferry_terminal.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/amenity=parking.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/amenity=taxi.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/barrier_bollard.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/barrier_enterance.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/barrier_gate.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/barrier_lift_gate.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/barrier_stile.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/barrier_toll_booth.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/highway=bus_stop.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/railway=station.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_aerodrome.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_aerodrome2.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_airport.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_airport2.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_bus_station.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_bus_stop.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_bus_stop2.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_car_share.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_ford.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_fuel.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_fuel_lpg.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_lighthouse.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_marina.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_parking.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_parking_bicycle.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_parking_car.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_parking_car_paid.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_parking_disabled.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_parking_private.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_parking_private2.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_parking_private3.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_port.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_rental_bicycle.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_rental_car.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_roundabout_anticlockwise.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_roundabout_clockwise.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_taxi_rank.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_traffic_lights.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_train_station.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_train_station2.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/transport/transport_tram_stop.svg"
    )
endif()

if("${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/qgis/svg/wind_roses" TYPE FILE FILES
    "/home/danilo/dev/cpp/QGIS/images/svg/wind_roses/WindRose_01.svg"
    "/home/danilo/dev/cpp/QGIS/images/svg/wind_roses/WindRose_02.svg"
    )
endif()

