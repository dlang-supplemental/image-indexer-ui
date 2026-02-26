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
- **HuggingFace & ModelScope Integration**: 
    - Add a "Model Store" tab to browse and download models (GGUF/ONNX).
    - Use their APIs to search for 'vision' or 'clip' models.

=== Design Aesthetics
- **Theme**: Dark mode by default with high contrast and modern typography (e.g. Inter/Roboto via DlangUI fonts).
- **Interactions**: Smooth hover effects on buttons and thumbnails.
- **Micro-animations**: Loading spinners, smooth transitions between search and results.


