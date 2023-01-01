class Pemasukan {
    Pemasukan({
        this.pemasukan,
    });

    String? pemasukan;

    factory Pemasukan.fromJson(Map<String, dynamic> json) => Pemasukan(
        pemasukan: json["pemasukan"],
    );

    Map<String, dynamic> toJson() => {
        "pemasukan": pemasukan,
    };
}
