class Pengeluaran {
  Pengeluaran({
    this.pengeluaran,
  });

  String? pengeluaran;

  factory Pengeluaran.fromJson(Map<String, dynamic> json) => Pengeluaran(
        pengeluaran: json["pengeluaran"],
      );

  Map<String, dynamic> toJson() => {
        "pengeluaran": pengeluaran,
      };
}
