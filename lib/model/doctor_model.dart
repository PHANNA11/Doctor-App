class DoctorModel {
  int? id;
  String? name;
  String? image;
  String? position;
  String? contact;
  bool? isFavorite;
  DoctorModel(
      {this.id,
      this.name,
      this.image,
      this.position,
      this.contact,
      this.isFavorite});
  List<DoctorModel> get listDoctors => [
        DoctorModel(
            id: 2,
            name: 'Dr. Albert',
            image:
                'https://static.vecteezy.com/system/resources/thumbnails/041/409/060/small/ai-generated-a-female-doctor-with-a-stethoscope-isolated-on-transparent-background-free-png.png',
            position: 'Heart Specialist',
            contact: '0965432139',
            isFavorite: true),
        DoctorModel(
            id: 3,
            name: 'Dr. Albert',
            image:
                'https://static.vecteezy.com/system/resources/thumbnails/041/409/060/small/ai-generated-a-female-doctor-with-a-stethoscope-isolated-on-transparent-background-free-png.png',
            position: 'Heart Specialist',
            contact: '0965432139',
            isFavorite: false),
        DoctorModel(
            id: 4,
            name: 'Dr. Matin',
            image:
                'https://img.freepik.com/premium-photo/professional-medical-profile-office-setting_153608-107724.jpg?size=626&ext=jpg',
            position: 'Heart Specialist',
            contact: '0965432139',
            isFavorite: true),
        DoctorModel(
            id: 5,
            name: 'Dr. Andrew',
            image:
                'https://media.gettyimages.com/id/565975291/photo/hispanic-doctor-reading-medical-chart-in-office.jpg?s=612x612&w=0&k=20&c=VrsQE3rWGDv1OSAG1VqHEZaNMOkgDUUhtTEYX8cGGZg=',
            position: 'Heart Specialist',
            contact: '0965432139',
            isFavorite: true),
      ];
}
