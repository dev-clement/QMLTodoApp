cmake_minimum_required(VERSION 3.16)

project(QMLTodoApp VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

include_directories(backend/include)

qt_add_executable(appQMLTodoApp
    main.cpp
)

qt_add_qml_module(appQMLTodoApp
    URI QMLTodoApp
    VERSION 1.0
    QML_FILES
        Main.qml
        utils/AppPopup.qml
        utils/CustomTextField.qml
        utils/CustomScrollBar.qml
    RESOURCES
        resources.qrc
    SOURCES
        backend/include/backendhelper.hpp
        backend/src/backendhelper.cpp
        QML_FILES utils/CustomPopup.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appQMLTodoApp PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appQMLTodoApp
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appQMLTodoApp
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appQMLTodoApp
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
