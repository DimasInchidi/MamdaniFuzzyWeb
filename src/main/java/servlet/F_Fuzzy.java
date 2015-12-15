package servlet;

import java.util.ArrayList;

/**
 * 2015 Dimas Ari for all my friends. Thanks
 */
public class F_Fuzzy {

    private final int[][] abc = {
            {0, 1, 0}, //jeniskelamin
            {35, 39, 43}, //nomorsepatu
            {1, 3, 5}, //warnakulit
            {140, 160, 180} //tinggibadan
    };

    private final int[][] aturan = {
            {1, 1, 2, 1, 0},//    [R1] IF jeniskelamin SAMA AND nomorsepatu SAMA THEN NilaiKemiripan BERTAMBAH.
            {3, 1, 4, 1, 0},//    [R2] IF warnakulit SAMA AND tinggibadan SAMA THEN NilaiKemiripan BERTAMBAH.
            {1, 0, 2, 0, -1},//    [R3] IF jeniskelamin BEDA AND nomorsepatu BEDA THEN NilaiKemiripan BERKURANG.
            {3, 0, 4, 0, -1},//    [R4] IF warnakulit BEDA AND tinggibadan BEDA THEN NilaiKemiripan BERKURANG.
            {1, 1, 2, 0, 0},//    [R5] IF jeniskelamin SAMA AND nomorsepatu BEDA THEN NilaiKemiripan BERTAMBAH.
            {3, 1, 4, 0, 0},//    [R6] IF warnakulit SAMA AND tinggibadan BEDA THEN NilaiKemiripan BERTAMBAH.
            {1, 0, 2, 1, -1},//    [R7] IF jeniskelamin BEDA AND nomorsepatu SAMA THEN NilaiKemiripan BERKURANG.
            {3, 0, 4, 1, -1},//    [R8] IF warnakulit BEDA AND tinggibadan SAMA THEN NilaiKemiripan BERKURANG.
    };
    protected float[] Predikati, NKsama, NKbeda, zi;

    public float FIS(int[] value) {

        // Mencari Nilai Keanggotaan
        ArrayList<Float> floatList = new ArrayList<>();
        for (int i = 0; i < value.length; i++) {
            floatList.add(NilaiKeanggotaan(value[i], abc[i][0], abc[i][1], abc[i][2]));
        }
        int j = 0;
        NKsama = new float[floatList.size()];
        NKbeda = new float[floatList.size()];
        for (Float f : floatList) {
            NKsama[j] = (f != null ? f : Float.NaN);
            NKbeda[j] = InversNK(NKsama[j]);
            j++;
        }
        // Mencari a-predikat dan nilai z untuk setiap aturan
        Predikati = new float[aturan.length];
        zi = new float[aturan.length];
        for (int i = 0; i < aturan.length; i++) {
            float ini, itu;
            if (aturan[i][1] == 1) {
                ini = NKsama[aturan[i][0] - 1];
            } else {
                ini = NKbeda[aturan[i][0] - 1];
            }
            if (aturan[i][3] == 1) {
                itu = NKsama[aturan[i][2] - 1];
            } else {
                itu = NKbeda[aturan[i][2] - 1];
            }
            Predikati[i] = PredikatI(ini, itu);
            zi[i] = Zi(Predikati[i], aturan[i][4] == 0);
        }

        // Mencari nilai Z dan mengembalikannya
        return Znya();
    }

    public float Znya() {
        float atas = 0, bawah = 0;
        int i = 0;
        for (float Predikat : Predikati) {
            atas += Predikat * zi[i];
            bawah += Predikat;
            i++;
        }
        return atas / bawah;
    }

    public float Zi(float aPi, boolean bertambah) {
        if (bertambah) {
            return 100 * aPi;
        } else {
            return 100 - 100 * aPi;
        }
    }

    // SEMUA aturan menggunakan operator logika AND
    public float PredikatI(float nk1, float nk2) {
        return Math.min(nk1, nk2);
    }

    // SEMUA variable fuzzy kecuali NilaiKemiripan terdiri atas 2 Himpunan Fuzzy {SAMA, BEDA}
    public float NilaiKeanggotaan(int x, int a, int b, int c) {
        if (x == b) {
            return 1f;
        } else if (x < b) {
            if (x > a) {
                return (float) (x - a) / (b - a);
            } else {
                return 0f;
            }
        } else {
            if (x < c) {
                return (float) (c - x) / (c - b);
            } else {
                return 0f;
            }
        }
    }

    public float InversNK(float NK) {
        return 1 - NK;
    }

}
