import Foundation
import CryptoSwift
import SwiftKeccak
import K1


extension StringProtocol {
    var hexaData: Data { .init(hexa) }
    var hexaBytes: [UInt8] { .init(hexa) }
    private var hexa: UnfoldSequence<UInt8, Index> {
        sequence(state: startIndex) { startIndex in
            guard startIndex < self.endIndex else { return nil }
            let endIndex = self.index(startIndex, offsetBy: 2, limitedBy: self.endIndex) ?? self.endIndex
            defer { startIndex = endIndex }
            return UInt8(self[startIndex..<endIndex], radix: 16)
        }
    }
}


let privateKey = "412d475fa58ce986004f1014cf6ff8c55b3a089ae6cb44faddfb1a3032fe5970".hexaBytes;



let p = try K1.PrivateKey.import(rawRepresentation: privateKey)

print("公钥Hex", try p.publicKey.rawRepresentation(format: .uncompressed).toHexString())
print("公钥Base64", try p.publicKey.rawRepresentation(format: .uncompressed).toBase64())

let message = keccak256("hello")

print("代签名消息hash", message.toHexString())

let signature = try p.ecdsaSign(hashed: message)

print(signature.rawRepresentation.base64EncodedString())
