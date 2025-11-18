import 'package:flutter/material.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  int currentStep = 0;
  double uploadProgress = 0.0;
  bool isUploading = false;
  bool uploadDone = false;

  // ========================= VIEW BUILDER ==============================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: IndexedStack(
          index: currentStep,
          children: [
            _buildFormPage(), // Step 0
            _buildUploadPage(), // Step 1
            _buildUploadingPage(), // Step 2
            _buildSuccessPage(), // Step 3
          ],
        ),
      ),
    );
  }

  // =====================================================================
  // STEP 0 — FORM PAGE
  // =====================================================================
  Widget _buildFormPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.arrow_back_ios_new),
              SizedBox(width: 10),
              Text(
                "Isi formulir ini",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 30),
          _formInput("Nama Lengkap"),
          _formInput("Alamat"),
          _formInput("Nomor Telepon"),
          _formInput("Street Address"),

          Row(
            children: [
              Expanded(child: _formInput("Kota")),
              const SizedBox(width: 14),
              Expanded(child: _formInput("Kode Pos")),
            ],
          ),

          _dropdown("Provinsi"),

          const SizedBox(height: 60),
          _button("Next", () {
            setState(() => currentStep = 1);
          }),
        ],
      ),
    );
  }

  Widget _formInput(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: TextField(
        decoration: InputDecoration(
          hintText: label,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget _dropdown(String text) {
    return Container(
      padding: const EdgeInsets.only(bottom: 22, top: 10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: const TextStyle(color: Colors.black87)),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }

  // =====================================================================
  // STEP 1 — UPLOAD PAGE (AWAL)
  // =====================================================================
  Widget _buildUploadPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () => setState(() => currentStep = 0),
                child: const Icon(Icons.arrow_back_ios_new),
              ),
              const SizedBox(width: 10),
              const Text(
                "Upload",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 26),

          const Text(
            "Unggah Dokumen Anda",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            "Add your documents here, and you can upload up...",
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),

          const SizedBox(height: 20),

          _uploadBox(),

          const Spacer(),

          _button("Save", null, disabled: true),
        ],
      ),
    );
  }

  Widget _uploadBox() {
    return GestureDetector(
      onTap: () {
        // lanjutkan ke step upload
        setState(() {
          currentStep = 2;
          isUploading = true;
        });

        _startUploadProgress();
      },
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.cloud_upload_outlined, size: 40, color: Colors.grey),
              SizedBox(height: 12),
              Text("Drag your file(s) to start uploading"),
              SizedBox(height: 6),
              Text("OR", style: TextStyle(color: Colors.grey)),
              SizedBox(height: 6),
              Text(
                "Browse Files",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // =====================================================================
  // STEP 2 — UPLOADING PAGE
  // =====================================================================
  Widget _buildUploadingPage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: const Icon(Icons.arrow_back_ios_new),
              ),
              const SizedBox(width: 12),
              const Text(
                "Upload",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 30),

          const Text(
            "Unggah Dokumen Anda",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            "Add your documents here, and you can upload up...",
            style: TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 20),
          _uploadBox(),

          const SizedBox(height: 22),

          // ===== PROGRESS BAR =====
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Uploading..."),
                const SizedBox(height: 8),

                LinearProgressIndicator(
                  value: uploadProgress,
                  minHeight: 6,
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),

                const SizedBox(height: 8),
                Text(
                  "${(uploadProgress * 100).toInt()}% - "
                  "${(30 - uploadProgress * 30).toInt()} seconds remaining",
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),

          const Spacer(),
          _button("Save", null, disabled: true),
        ],
      ),
    );
  }

  void _startUploadProgress() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 120));

      setState(() {
        uploadProgress += 0.02;
        if (uploadProgress >= 1.0) {
          uploadDone = true;
          currentStep = 3;
        }
      });

      return uploadProgress < 1;
    });
  }

  // =====================================================================
  // STEP 3 — SUCCESS PAGE
  // =====================================================================
  Widget _buildSuccessPage() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                children: [
                  Image.asset("assets/images/logo.jpg", width: 90),
                  const SizedBox(height: 20),

                  const Text(
                    "Dokumen anda berhasil diunggah",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),

                  const SizedBox(height: 30),
                  const Icon(Icons.check_circle, color: Colors.blue, size: 70),
                ],
              ),
            ),

            const SizedBox(height: 40),
            _button("Next", () {
              // kembali ke awal
              setState(() {
                currentStep = 0;
                uploadProgress = 0;
              });
            }),
          ],
        ),
      ),
    );
  }

  // ================= BUTTON ==============================================
  Widget _button(String text, VoidCallback? onTap, {bool disabled = false}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: disabled ? null : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: disabled
              ? Colors.grey.shade400
              : const Color(0xFF4EAAA8),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(text, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
