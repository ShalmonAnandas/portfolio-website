import 'package:flutter/material.dart';
import 'package:flutter_animate_on_scroll/flutter_animate_on_scroll.dart';
import 'package:portfolio_website/home_page/home_page.dart';
import 'package:portfolio_website/utils/colors.dart';
import 'package:portfolio_website/utils/static_text.dart';
import 'package:portfolio_website/widgets/landscape_header.dart';
import 'package:portfolio_website/widgets/portrait_header.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:scroll_animator/scroll_animator.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  static const String routeName = '/contact';

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  late final ScrollController _scrollController;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  late List<Widget> ctaList = [
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: InkWell(
        onTap: () => QR.popUntilOrPush(HomePage.routeName),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            StaticText.home,
            style: TextStyle(
              color: context.customColors.gunMetal,
              fontSize: 16,
            ),
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: InkWell(
        onTap: () => QR.popUntilOrPush('/aboutme'),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            StaticText.aboutMe,
            style: TextStyle(
              color: context.customColors.gunMetal,
              fontSize: 16,
            ),
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: InkWell(
        onTap: () => QR.popUntilOrPush('/projects'),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            StaticText.myProjects,
            style: TextStyle(
              color: context.customColors.gunMetal,
              fontSize: 16,
            ),
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: InkWell(
        onTap: () => QR.popUntilOrPush('/resume'),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            StaticText.resume,
            style: TextStyle(
              color: context.customColors.gunMetal,
              fontSize: 16,
            ),
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: InkWell(
        onTap: () => QR.popUntilOrPush('/blog'),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(
            StaticText.blog,
            style: TextStyle(
              color: context.customColors.gunMetal,
              fontSize: 16,
            ),
          ),
        ),
      ),
    ),
  ];

  @override
  void initState() {
    _scrollController = AnimatedScrollController(
      animationFactory: const ChromiumImpulse(),
    );
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == 0) {
        QR.back();
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(MediaQuery.of(context).size.height * 0.1,
          duration: Duration(milliseconds: 200), curve: Curves.easeIn);
    });
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Widget _buildSocialLink({
    required IconData icon,
    required String label,
    required String url,
    required int delay,
  }) {
    return SlideInLeft(
      config: BaseAnimationConfig(
        delay: Duration(milliseconds: delay),
        child: GestureDetector(
          onTap: () => print("Open $label: $url"),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              margin: EdgeInsets.only(bottom: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: context.customColors.gunMetal,
                    size: 24,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          label,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: context.customColors.gunMetal,
                          ),
                        ),
                        Text(
                          url,
                          style: TextStyle(
                            fontSize: 14,
                            color: context.customColors.cadetGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.open_in_new,
                    color: context.customColors.cadetGrey,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required TextEditingController controller,
    required String validatorMessage,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: context.customColors.gunMetal,
            ),
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: controller,
            maxLines: maxLines,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: context.customColors.cadetGrey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: context.customColors.gunMetal, width: 2),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return validatorMessage;
              }
              if (label == 'Email' && !value.contains('@')) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission
      print("Form submitted:");
      print("Name: ${_nameController.text}");
      print("Email: ${_emailController.text}");
      print("Message: ${_messageController.text}");
      
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Message sent successfully! I'll get back to you soon."),
          backgroundColor: context.customColors.gunMetal,
        ),
      );
      
      // Clear form
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          width: width,
          decoration: BoxDecoration(
            color: context.customColors.dutchWhite,
          ),
          child: Column(
            children: [
              SizedBox(height: height * 0.1),
              (MediaQuery.of(context).size.aspectRatio > 0.8)
                  ? LandscapeHeader(
                      height: height,
                      width: width,
                      ctaList: ctaList,
                      headerColor: context.customColors.gunMetal,
                    )
                  : PortraitHeader(
                      height: height,
                      width: width,
                      headerColor: context.customColors.gunMetal,
                    ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    SlideInLeft(
                      config: BaseAnimationConfig(
                        delay: 200.ms,
                        child: Text(
                          "Get In Touch",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    SlideInLeft(
                      config: BaseAnimationConfig(
                        delay: 400.ms,
                        child: Text(
                          "I'd love to hear from you! Whether you have a project in mind, want to collaborate, or just want to say hello.",
                          style: TextStyle(
                            fontSize: 18,
                            color: context.customColors.cadetGrey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height: 48),
                    
                    Container(
                      constraints: BoxConstraints(maxWidth: 1000),
                      child: MediaQuery.of(context).size.width > 768
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Contact Form
                                Expanded(
                                  flex: 2,
                                  child: _buildContactForm(),
                                ),
                                SizedBox(width: 48),
                                // Contact Info
                                Expanded(
                                  flex: 1,
                                  child: _buildContactInfo(),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                _buildContactForm(),
                                SizedBox(height: 48),
                                _buildContactInfo(),
                              ],
                            ),
                    ),
                    
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactForm() {
    return SlideInLeft(
      config: BaseAnimationConfig(
        delay: 600.ms,
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Send a Message",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: context.customColors.gunMetal,
                  ),
                ),
                SizedBox(height: 24),
                _buildFormField(
                  label: "Name",
                  controller: _nameController,
                  validatorMessage: "Please enter your name",
                ),
                _buildFormField(
                  label: "Email",
                  controller: _emailController,
                  validatorMessage: "Please enter your email",
                  keyboardType: TextInputType.emailAddress,
                ),
                _buildFormField(
                  label: "Message",
                  controller: _messageController,
                  validatorMessage: "Please enter your message",
                  maxLines: 5,
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.customColors.gunMetal,
                      foregroundColor: context.customColors.dutchWhite,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Send Message",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo() {
    return Column(
      children: [
        SlideInLeft(
          config: BaseAnimationConfig(
            delay: 800.ms,
            child: Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: context.customColors.gunMetal,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text(
                    "Let's Connect",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: context.customColors.dutchWhite,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "I'm always open to discussing new opportunities, interesting projects, or just having a chat about technology.",
                    style: TextStyle(
                      fontSize: 16,
                      color: context.customColors.dutchWhite,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 24),
        _buildSocialLink(
          icon: Icons.email,
          label: "Email",
          url: "shalmon.anandas@example.com",
          delay: 1000,
        ),
        _buildSocialLink(
          icon: Icons.code,
          label: "GitHub",
          url: "github.com/ShalmonAnandas",
          delay: 1200,
        ),
        _buildSocialLink(
          icon: Icons.work,
          label: "LinkedIn",
          url: "linkedin.com/in/shalmon-anandas-466845206",
          delay: 1400,
        ),
        _buildSocialLink(
          icon: Icons.language,
          label: "Personal Blog",
          url: "emotions-and-tech-tips.vercel.app",
          delay: 1600,
        ),
      ],
    );
  }
}