 extern "C" void main() {
 // Pointer to Video Memory
 char* video_memory = (char*)0xb8000;

 // Print ’X’ in the top-left corner
 video_memory[0] = ’X’;
 video_memory[1] = 0x0f; // White on Black
 }
