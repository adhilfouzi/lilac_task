# Lilac Task - Flutter Chat Application

This Flutter project implements a chat application with features like user authentication, contact lists, and real-time messaging.

## Architecture

The application follows a layered architecture:

-   **UI Layer:**  Comprises the screens and widgets responsible for user interaction and presentation. Located in the `lib/feature` directory.
-   **Business Logic Layer:**  Manages the application's business logic, state management, and data handling. Implemented using Providers in the `lib/providers` directory.
-   **Data Layer:** Handles data retrieval and persistence.  Includes models in `lib/data/models` and API services in `lib/utils/http`.
-   **Utility Layer:** Contains helper classes, constants, and route definitions. Located in the `lib/utils` directory.

## Key Components

-   **`main.dart`:**  The entry point of the application. Sets up the `MultiProvider` to provide `AuthProvider` and `ChatProvider` instances. Defines routes and theme.
-   **`lib/providers`:**
    -   `AuthProvider`: Manages user authentication state.
    -   `ChatProvider`: Manages chat-related data, including contact lists and messages. Fetches data from `ChatApi`.
-   **`lib/feature/auth`:** Contains screens for authentication, including `BoardingScreen`, `PhoneAuthScreen`, and `OTPScreen`.
-   **`lib/feature/chat`:**
    -   `MessageScreen`:  Displays the list of recent chats/contacts. Uses `ChatListSection`, `ChatStorySection`, and `ChatSearchBar` widgets.
    -   `ChatScreen`: Displays the chat interface for a selected user.
    -   `widget`: Contains reusable widgets like `ChatListSection`.
-   **`lib/utils/http`:**
    -   `ChatApi`:  Handles API calls related to chat functionality, such as fetching contacts and messages.
    -   `HttpService`:  A generic HTTP service for making API requests.
-   **`lib/utils/routes`:** Defines named routes for navigation using `AppRoutes`.

## Approach

-   **State Management:** Provider is used for managing application state.  `ChatProvider` holds the chat contacts and messages.
-   **Data Fetching:**  `ChatApi` is used to fetch data from a remote API.  `HttpService` provides a reusable way to make HTTP requests.
-   **UI Structure:**  The UI is built using Flutter widgets and organized into reusable components. `ListView.separated` is used to display lists of data.
-   **Navigation:**  `Navigator.pushNamed` is used for navigating between screens, with route definitions in `AppRoutes`.  `onGenerateRoute` handles passing arguments to routes.

## Data Flow

1.  The `MessageScreen` initializes the `ChatProvider`.
2.  `ChatProvider` fetches chat contacts from `ChatApi` or uses demo data from `UserList`.
3.  The `ChatListSection` widget displays the list of chat contacts using data from the `ChatProvider`.
4.  Tapping on a chat contact navigates to the `ChatScreen`, passing the `ChatUser` object as an argument.
5.  The `ChatScreen` displays the chat interface for the selected user.

## Future Enhancements

-   Implement real-time messaging using WebSockets or a similar technology.
-   Add support for sending and receiving different types of messages (e.g., images, videos).
-   Improve the UI and user experience.
-   Implement proper error handling and loading states.