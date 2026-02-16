= UI Implementation Plan

== Overview
DlangUI frontend for the Image Indexer.

=== Logic
- **State Management**: Simple state store for loaded images and search results.
- **Async Execution**: Indexing must happen in a separate thread to avoid freezing UI.

=== Components
- **ImageGrid**: Custom widget to display thumbnails.
- **SearchBar**: Input for text queries.
- **StatusPanel**: Progress bar for indexing.

=== Future
- **Virtualization**: Handle checking 10k+ images without UI lag.
- **Settings**: Configure model paths and hardware acceleration (CPU/CUDA/ROCm).
